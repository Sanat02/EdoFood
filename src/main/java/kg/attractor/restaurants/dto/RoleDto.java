package kg.attractor.restaurants.dto;

import lombok.Builder;
import lombok.Data;

@Data
@Builder
public class RoleDto {
    private int id;
    private String name;
}
