class CollaboratorsController < ApplicationController
   def index
   end
   def create
     @wiki = Wiki.find(params[:wiki_id])

     @user = User.where(email: params[:email]).take

     # is there a class method for this check?
     if @user == nil
       flash[:error] = "Collaborator could not be found."
       redirect_to edit_wiki_path(@wiki)
     elsif @wiki.collaborators.include?(@user)
       flash[:error] = "Collaborator already exists."
       redirect_to edit_wiki_path(@wiki)
     else
       collaborator = @wiki.collaborators.build(user_id: @user.id)

       if collaborator.save
         flash[:notice] = "Your collaborator has been added to the wiki."
         redirect_to edit_wiki_path(@wiki)
       else
         flash[:error] = "Collaborator could not be added. Check spelling!"
         redirect_to edit_wiki_path(@wiki)
       end
     end
   end

   def destroy
     @collaborator = Collaborator.find(params[:id])
     @wiki = @collaborator.wiki

     if @collaborator.destroy
       flash[:notice] = "Collaborator removed from wiki."
       redirect_to edit_wiki_path(@wiki)
     else
       flash[:error] = "Collaborator could not be removed."
       redirect_to edit_wiki_path(@wiki)
     end
   end
 end
