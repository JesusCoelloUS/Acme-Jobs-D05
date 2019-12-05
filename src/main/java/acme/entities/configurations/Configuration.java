
package acme.entities.configurations;

import javax.persistence.Entity;

import org.hibernate.validator.constraints.Range;

import acme.framework.entities.DomainEntity;
import lombok.Getter;
import lombok.Setter;

@Entity
@Getter
@Setter
public class Configuration extends DomainEntity {

	private static final long	serialVersionUID	= 1L;

	private String				spamWords;

	@Range(min = 0, max = 100)
	private Double				threshold;
}
