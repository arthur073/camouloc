# -*- encoding : utf-8 -*-
module ColocHelper

   def nouveau_coloc?
      if signed_in? and  (current_user.coloc_id == @coloc.id or current_user.admin?) or @coloc.users.size == 0
         link_to "Inscrire un nouveau colocataire ?", new_user_path(:coloc_id => @coloc.id) 
      end
   end

   def edit_coloc?
      if signed_in? and (current_user.coloc_id == @coloc.id or current_user.admin?) 
         link_to "Editer la colocation", edit_coloc_path , :class=>"signup_button5"
      end 
   end 


   def delete_coloc?
      if signed_in? and (current_user.coloc_id == @coloc.id or current_user.admin?) 
         button_to "Supprimer définitivement la colocation.", @coloc, :method => :delete 
      end
   end

   def new_dep?
      if signed_in? and (current_user.coloc_id == @coloc.id or current_user.admin?) 
         link_to "Nouvelle dépense", choix_nbr_path(@coloc.id)
      end
   end

   def liste_users(users)
      link_to users.nom, user_path(users)  
   end


   def tableau_bord?
      if signed_in? and (current_user.coloc_id == @coloc.id or current_user.admin?)
         link_to "TABLEAU de BORD", tableau_bord_path(@coloc.id) 
      else 
         "Vous devez appartenir à cette colocation pour voir son tableau de bord. "
      end
   end
end
