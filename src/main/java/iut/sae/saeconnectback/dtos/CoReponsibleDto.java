package iut.sae.saeconnectback.dtos;

import jakarta.persistence.EmbeddedId;
import jakarta.persistence.Entity;
import jakarta.persistence.Table;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@Entity
@Table(name="co_responsables")
@NoArgsConstructor
public class CoReponsibleDto {

    @EmbeddedId
    private CoResponsibleId id;


}
