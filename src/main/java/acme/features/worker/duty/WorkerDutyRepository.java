
package acme.features.worker.duty;

import java.util.Collection;

import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import acme.entities.duties.Duty;
import acme.entities.jobs.Job;
import acme.entities.roles.Worker;
import acme.framework.repositories.AbstractRepository;

@Repository
public interface WorkerDutyRepository extends AbstractRepository {

	@Query("select j.duties from Job j where j.id=?1")
	Collection<Duty> findDutiesFromJob(int id);

	@Query("select j from Job j where j.id=?1")
	Job findOneJobById(int id);

	@Query("select d from Duty d where d.id=?1")
	Duty findOneDutyById(int id);

	@Query("select e from Worker e where e.id=?1")
	Worker findOneWorkerById(int id);
}
