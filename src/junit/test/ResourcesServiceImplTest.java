package junit.test;

import org.junit.Test;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import com.lanyuan.service.impl.ResourcesServiceImpl;

public class ResourcesServiceImplTest {

	@Test
	public void test() {
		        ApplicationContext ctx = new ClassPathXmlApplicationContext("spring-*.xml");  
		        ResourcesServiceImpl bean = (ResourcesServiceImpl)ctx.getBean("resourcesService");
		        bean.findAll();
		        bean.getById("1");
		        bean.getUserResources("1");
	}

}
