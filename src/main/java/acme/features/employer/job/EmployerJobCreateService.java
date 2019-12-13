
package acme.features.employer.job;

import java.util.Collection;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import acme.entities.configurations.Configuration;
import acme.entities.jobs.Job;
import acme.entities.roles.Employer;
import acme.features.administrator.configuration.AdministratorConfigurationRepository;
import acme.framework.components.Errors;
import acme.framework.components.Model;
import acme.framework.components.Request;
import acme.framework.services.AbstractCreateService;

@Service
public class EmployerJobCreateService implements AbstractCreateService<Employer, Job> {

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
	public Job instantiate(final Request<Job> request) {
		assert request != null;
		Job res = new Job();
		Employer e = this.repository.findOneEmployerById(request.getPrincipal().getActiveRoleId());
		res.setEmployer(e);
		res.setFinalMode(false);
		return res;
	}

	@Override
	public void validate(final Request<Job> request, final Job entity, final Errors errors) {
		assert request != null;
		assert entity != null;
		assert errors != null;
		errors.state(request, !this.isSpam(entity), "description", "employer.job.error.spam");
		errors.state(request, this.checkReference(entity), "reference", "employer.job.error.reference");
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

	private boolean checkReference(final Job job) {
		Collection<Job> all = this.repository.findAllJobs();
		for (Job j : all) {
			if (job.getReference().equals(j.getReference())) {
				return false;
			}
		}
		return true;
	}

	@Override
	public void create(final Request<Job> request, final Job entity) {
		assert request != null;
		assert entity != null;
		this.repository.save(entity);
	}

}
