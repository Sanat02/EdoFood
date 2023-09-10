package kg.attractor.restaurants.repository;

import kg.attractor.restaurants.model.Food;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;

public interface FoodRepository extends JpaRepository<Food,Integer> {
    Page<Food> findFoodsByRestaurantRestaurantId(int restaurantId, Pageable pageable);
}
