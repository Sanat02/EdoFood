package kg.attractor.restaurants.repository;

import kg.attractor.restaurants.model.User;
import org.springframework.data.jpa.repository.JpaRepository;

public interface UserRepository extends JpaRepository<User,Integer> {
}
