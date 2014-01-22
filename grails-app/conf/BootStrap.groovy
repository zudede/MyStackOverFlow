import mystackoverflow.User

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
		
    }
    def destroy = {
    }
}
