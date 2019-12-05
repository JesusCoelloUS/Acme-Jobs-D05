
package acme.entities.roles;

import java.util.Collection;

import javax.persistence.Entity;
import javax.persistence.OneToMany;
import javax.validation.constraints.NotBlank;

import acme.entities.records.AuditRecord;
import acme.framework.entities.UserRole;
import lombok.Getter;
import lombok.Setter;

@Entity
@Getter
@Setter
public class Auditor extends UserRole {

	private static final long		serialVersionUID	= 1L;

	//Properties

	@NotBlank
	private String					firm;

	@NotBlank
	private String					responsabilityStatement;

	//Relationships

	@OneToMany
	private Collection<AuditRecord>	auditRecords;

}
