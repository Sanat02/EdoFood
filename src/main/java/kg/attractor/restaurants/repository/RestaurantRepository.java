package kg.attractor.restaurants.repository;

import kg.attractor.restaurants.model.Restaurant;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.Optional;

public interface RestaurantRepository extends JpaRepository<Restaurant,Integer> {
    Page<Restaurant> findAll(Pageable pageable);

    Optional<Restaurant> findByNameIgnoreCase(String name);
}
