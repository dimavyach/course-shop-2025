package ua.com.kisit.onlineshop2025.entity;

import jakarta.persistence.Entity;
import jakarta.persistence.FetchType;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.ManyToMany;
import jakarta.persistence.Table;
import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.Pattern;
import jakarta.validation.constraints.Size;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;

import java.util.Collection;
import java.util.HashSet;
import java.util.Set;
import java.util.stream.Collectors;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@Entity
@Table(name = "users")
public class Users implements UserDetails {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @NotBlank(message = "Введіть логін")
    @Size(min = 3, max = 50, message = "Логін має містити від 3 до 50 символів")
    @Pattern(regexp = "^[A-Za-z0-9_]+$", message = "Логін може містити лише латинські літери, цифри та _")
    private String username;

    @NotBlank(message = "Введіть пароль")
    @Size(min = 6, max = 100, message = "Пароль має містити щонайменше 6 символів")
    private String password;

    @ManyToMany(fetch = FetchType.EAGER)
    private Set<Roles> roleset = new HashSet<>();

    @Override
    public Collection<? extends GrantedAuthority> getAuthorities() {
        return getRoleset().stream()
                .map(role -> (GrantedAuthority) role::getName)
                .collect(Collectors.toList());
    }
}
