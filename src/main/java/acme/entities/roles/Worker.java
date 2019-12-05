
package acme.entities.roles;

import java.util.Collection;

import javax.persistence.Entity;
import javax.persistence.OneToMany;
import javax.validation.constraints.NotBlank;

import acme.entities.applications.Application;
import acme.framework.entities.UserRole;
import lombok.Getter;
import lombok.Setter;

@Entity
@Getter
@Setter
public class Worker extends UserRole {

	private static final long		serialVersionUID	= 1L;

	//Properties

	@NotBlank
	private String					qualifications;

	@NotBlank
	private String					skills;

	//Relationships

	@OneToMany
	private Collection<Application>	applications;

}
