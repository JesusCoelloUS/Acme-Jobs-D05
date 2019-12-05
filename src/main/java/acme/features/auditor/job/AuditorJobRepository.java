
package acme.features.auditor.job;

import java.util.Collection;

import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import acme.entities.jobs.Job;
import acme.entities.roles.Auditor;
import acme.framework.repositories.AbstractRepository;

@Repository
public interface AuditorJobRepository extends AbstractRepository {

	@Query("select distinct j from Auditor a join a.auditRecords ar join ar.job j on a.id=?1")
	Collection<Job> findMyJobs(int id);
	
	@Query("select j from Job j where j not in (select distinct j1 from Auditor a join a.auditRecords ar join ar.job j1 where a.id=?1)")
	Collection<Job> findOtherJobs(int id);

	@Query("select j from Job j where j.id=?1")
	Job findOneJobById(int id);

	@Query("select e from Auditor e where e.id=?1")
	Auditor findOneAuditorById(int id);

}
