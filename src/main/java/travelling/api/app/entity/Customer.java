package travelling.api.app.entity;

import com.fasterxml.jackson.annotation.JsonFormat;
import lombok.Getter;
import lombok.Setter;
import org.springframework.data.annotation.CreatedDate;
import org.springframework.data.jpa.domain.support.AuditingEntityListener;

import javax.persistence.*;
import java.time.LocalDate;
import java.util.List;

@Entity(name = "customer")
@Getter
@Setter
@EntityListeners(AuditingEntityListener.class)
public class Customer {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private long id;
    @Column
    private String fullName;
    @Column
    private String phone;
    @Column
    private String email;
    @Column
    @CreatedDate
    @JsonFormat(shape = JsonFormat.Shape.STRING)
    private LocalDate createdDate;

    @OneToMany(mappedBy = "customer")
    private List<TourCustomerDetail> tourCustomerDetails;
}
