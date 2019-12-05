
package acme.entities.threadMessages;

import java.util.Date;

import javax.persistence.Entity;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.validation.constraints.NotBlank;
import javax.validation.constraints.Past;

import acme.framework.entities.DomainEntity;
import lombok.Getter;
import lombok.Setter;

@Entity
@Getter
@Setter
public class ThreadMessage extends DomainEntity {

	private static final long	serialVersionUID	= 1L;

	//Properties

	@NotBlank
	private String				title;

	@Past
	@Temporal(TemporalType.TIMESTAMP)
	private Date				creationMoment;

	private String				tags;

	@NotBlank
	private String				body;

}
