package kg.attractor.restaurants.dto;

import lombok.Builder;
import lombok.Data;

@Data
@Builder
public class UserDto {
    private int id;
    private String accountName;
    private String email;
    private RoleDto role;
    private String password;
}
