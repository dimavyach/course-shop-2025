package ua.com.kisit.onlineshop2025.entity;

import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.MapKey;
import jakarta.persistence.MapsId;
import jakarta.persistence.OneToMany;
import jakarta.persistence.OneToOne;
import jakarta.persistence.Table;
import jakarta.validation.constraints.Email;
import jakarta.validation.constraints.Max;
import jakarta.validation.constraints.Min;
import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.NotNull;
import jakarta.validation.constraints.Pattern;
import jakarta.validation.constraints.Size;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import java.util.List;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@Entity
@Table(name = "clients")
public class Clients {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @NotBlank(message = "Введіть ім'я")
    @Size(min = 2, max = 50, message = "Ім'я має містити від 2 до 50 символів")
    @Pattern(regexp = "^[A-Za-zА-Яа-яІіЇїЄєҐґ\\-'’ ]+$", message = "Ім'я може містити лише літери, пробіл, дефіс або апостроф")
    private String firstName;

    @NotBlank(message = "Введіть прізвище")
    @Size(min = 2, max = 50, message = "Прізвище має містити від 2 до 50 символів")
    @Pattern(regexp = "^[A-Za-zА-Яа-яІіЇїЄєҐґ\\-'’ ]+$", message = "Прізвище може містити лише літери, пробіл, дефіс або апостроф")
    private String lastName;

    @NotBlank(message = "Введіть email")
    @Email(message = "Введіть коректний email")
    @Size(max = 100, message = "Email занадто довгий")
    @Pattern(regexp = "^[^\\s@]+@[^\\s@]+\\.[^\\s@]{2,}$", message = "Email має містити @ і домен, наприклад name@example.com")
    private String email;

    @NotBlank(message = "Введіть телефон")
    @Pattern(regexp = "^\\+?[0-9]{10,15}$", message = "Телефон має містити 10-15 цифр, можна з + на початку")
    private String phone;

    @NotNull(message = "Введіть вік")
    @Min(value = 14, message = "Вік має бути не менше 14")
    @Max(value = 120, message = "Вік має бути не більше 120")
    private Integer age;

    @OneToOne
    @MapsId
    @MapKey
    @JoinColumn(name = "id")
    private Users user;

    @OneToMany(mappedBy = "clientes")
    private List<Address> addresses;

    @OneToMany(mappedBy = "client")
    private List<Orders> orders;
}
