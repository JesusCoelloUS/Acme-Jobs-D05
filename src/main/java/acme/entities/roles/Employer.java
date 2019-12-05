
package acme.entities.roles;

import java.util.Collection;

import javax.persistence.Entity;
import javax.persistence.OneToMany;
import javax.validation.constraints.NotBlank;

import acme.entities.jobs.Job;
import acme.framework.entities.UserRole;
import lombok.Getter;
import lombok.Setter;

@Entity
@Getter
@Setter
public class Employer extends UserRole {

	private static final long	serialVersionUID	= 1L;

	//Properties

	@NotBlank
	private String				company;

	@NotBlank
	private String				sector;

	//Relationships

	@OneToMany
	private Collection<Job>		jobs;

}
