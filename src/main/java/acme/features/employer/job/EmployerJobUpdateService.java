
package acme.features.employer.job;

import java.util.Collection;
import java.util.Date;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import acme.entities.configurations.Configuration;
import acme.entities.duties.Duty;
import acme.entities.jobs.Job;
import acme.entities.roles.Employer;
import acme.features.administrator.configuration.AdministratorConfigurationRepository;
import acme.framework.components.Errors;
import acme.framework.components.Model;
import acme.framework.components.Request;
import acme.framework.services.AbstractUpdateService;

@Service
public class EmployerJobUpdateService implements AbstractUpdateService<Employer, Job> {

	@Autowired
	EmployerJobRepository					repository;
	@Autowired
	AdministratorConfigurationRepository	configurationRepository;


	@Override
	public boolean authorise(final Request<Job> request) {
		assert request != null;
		return true;
	}

	@Override
	public void bind(final Request<Job> request, final Job entity, final Errors errors) {
		assert request != null;
		assert entity != null;
		assert errors != null;
		request.bind(entity, errors);
	}

	@Override
	public void unbind(final Request<Job> request, final Job entity, final Model model) {
		assert request != null;
		assert entity != null;
		assert model != null;
		request.unbind(entity, model, "reference", "status", "title", "deadline", "salary", "moreInfo", "description", "finalMode");
	}

	@Override
	public Job findOne(final Request<Job> request) {
		assert request != null;
		return this.repository.findOneJobById(request.getModel().getInteger("id"));
	}

	@Override
	public void validate(final Request<Job> request, final Job entity, final Errors errors) {
		assert request != null;
		assert entity != null;
		assert errors != null;
		errors.state(request, this.checkReference(entity), "reference", "employer.job.error.reference");
		errors.state(request, !this.isSpam(entity), "description", "employer.job.error.spam");
		errors.state(request, this.dutyCompleted(entity), "finalMode", "employer.job.error.duties");
		errors.state(request, entity.getDeadline().after(new Date()), "deadline", "employer.job.error.deadline");
	}

	private boolean checkReference(final Job job) {
		Collection<Job> all = this.repository.findAllJobs();
		for (Job j : all) {
			if (!job.equals(j) && job.getReference().equals(j.getReference())) {
				return false;
			}
		}
		return true;
	}

	private boolean dutyCompleted(final Job job) {
		if (!job.getFinalMode()) {
			return true;
		}
		Collection<Duty> duties = this.repository.findDutiesFromJob(job.getId());
		Double sum = duties.stream().mapToDouble(j -> j.getPercentage()).sum();
		return sum == 100.;
	}

	private boolean isSpam(final Job j) {
		Collection<Configuration> cs = this.configurationRepository.findMany();
		Configuration c = null;
		for (Configuration co : cs) {
			c = co;
			break;
		}
		String[] spamWords = c.getSpamWords().split(",");
		Integer nSpamWords = 0;
		for (String s : spamWords) {
			if (j.getTitle().contains(s) || j.getDescription().contains(s)) {
				nSpamWords++;
			}
		}
		return nSpamWords >= c.getThreshold();
	}

	@Override
	public void update(final Request<Job> request, final Job entity) {
		assert request != null;
		assert entity != null;
		this.repository.save(entity);
	}

}
