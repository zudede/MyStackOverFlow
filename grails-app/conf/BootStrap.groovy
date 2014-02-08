import mystackoverflow.User
import mystackoverflow.Tag

class BootStrap {

    def init = { servletContext ->
		def admin = new User()
		admin.isAdmin=true;
		admin.isModerator=true;
		admin.login="admin";
		admin.passwordHash="admin";
		admin.email="admin@stackoverflow.fr"
		admin.pseudo="admin"
		admin.name="admin"
		admin.birthday=new Date()
		admin.firstName="admin"
		admin.save()
		
		def tag = new Tag();
		tag.name = "Java"
		tag.save()
		
		tag = new Tag();
		tag.name = "C++"
		tag.save()
		
		tag = new Tag();
		tag.name = "Php"
		tag.save()
		
		tag = new Tag();
		tag.name = "HTML"
		tag.save()
		
		tag = new Tag();
		tag.name = "UML"
		tag.save()
		
		tag = new Tag();
		tag.name = "Ruby"
		tag.save()
		
		tag = new Tag();
		tag.name = "Pearl"
		tag.save()
		
		tag = new Tag();
		tag.name = "css"
		tag.save()
		
		tag = new Tag();
		tag.name = "web"
		tag.save()
		
		tag = new Tag();
		tag.name = "C#"
		tag.save()
		
		tag = new Tag();
		tag.name = "Android"
		tag.save()
		
		tag = new Tag();
		tag.name = "iOs"
		tag.save()
		
		tag = new Tag();
		tag.name = "WPF"
		tag.save()
		
		tag = new Tag();
		tag.name = "Windows Form"
		tag.save()
		
		
    }
    def destroy = {
    }
}
