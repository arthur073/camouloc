module TroisDepensesHelper

        def users1?
                if current_user.id == @colocataires[0].id
                        @colocataires[1].nom
                elsif current_user.id == @colocataires[1].id
                        @colocataires[0].nom
                elsif current_user.id == @colocataires[2].id
                        @colocataires[0].nom
                end
        end 
        
        def users2?
                if current_user.id == @colocataires[0].id
                        @colocataires[2].nom
                elsif current_user.id == @colocataires[1].id
                        @colocataires[2].nom
                elsif current_user.id == @colocataires[2].id
                        @colocataires[1].nom
                end
        end 

end
