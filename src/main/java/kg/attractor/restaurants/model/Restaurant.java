package kg.attractor.restaurants.model;

import jakarta.persistence.*;
import lombok.*;

import java.util.List;

@Getter
@Setter
@Builder
@NoArgsConstructor(access = AccessLevel.PROTECTED)
@AllArgsConstructor(access = AccessLevel.PRIVATE)
@Entity
@Table(name = "restaurants")
public class Restaurant {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private  int restaurantId;
    private String name;


    private String description;
    private String address;
    private String phoneNumber;

    @ManyToOne(fetch = FetchType.EAGER)
    @JoinColumn(name = "user_id")
    private User user;

    @OneToMany(fetch= FetchType.LAZY,mappedBy = "restaurant")
    private List<Food> foods;

    @OneToMany(fetch= FetchType.LAZY,mappedBy = "restaurant")
    private List<Rating> ratings;
}
