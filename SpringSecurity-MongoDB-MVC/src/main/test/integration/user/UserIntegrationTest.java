package integration.user;

import javax.annotation.Resource;

import org.junit.After;
import org.junit.Before;
import org.junit.runner.RunWith;
import org.springframework.data.mongodb.core.MongoTemplate;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.antuansoft.mongodb.domain.User;
import com.antuansoft.mongodb.repositories.UserRepositoryDao;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = { "mongo-config-test.xml" })

public class UserIntegrationTest {

	@Resource
	UserRepositoryDao userRespositoryDao;
	
	@Resource
	MongoTemplate mongoTemplate;
	
	/**
	 * Método que se ejecuta antes de cada test
	 * Preparo la base de datos para los test
	 */
	@Before
	public void before(){
		
		mongoTemplate.dropCollection(User.class);
		
	}
	
	//TUS TEST AQUI
	
	/**
	 * Método que se ejecuta después de cada Test.
	 * Dejamos la base de dato limpia para el siguiente test
	 */
	@After
	public void after(){
		
		mongoTemplate.dropCollection(User.class);
		
	}
	
	
	
}
