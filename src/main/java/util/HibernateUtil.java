package util;

import org.hibernate.SessionFactory;
import org.hibernate.boot.MetadataSources;
import org.hibernate.boot.registry.StandardServiceRegistry;
import org.hibernate.boot.registry.StandardServiceRegistryBuilder;

public class HibernateUtil {
	public static SessionFactory getSessionFactory() {
		SessionFactory sessionFactory = null;

		final StandardServiceRegistry registry = new StandardServiceRegistryBuilder()
					.configure()	//configure settings from hibernate.cfg.xml
					.build();
		try {
			sessionFactory = new MetadataSources(registry).buildMetadata().buildSessionFactory();
		} catch(Exception e){
			StandardServiceRegistryBuilder.destroy(registry);
		}

		return sessionFactory;
	}
}