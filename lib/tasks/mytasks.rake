task :delete_unused_colocs => :environment do
        desc "Detruit les colocations sans utilisateurs"
        @colocs = Coloc.all
        @colocs.each do |col|
                if (col.users.count == 0)
                        col.destroy
                end
        end

        puts "Coloc destroyed" 
end



task :assign_auto => :environment do
        desc "Initialise le champ auto des depenses a 0"
        @depenses = Depense.all
        @depenses2 = TroisDepense.all
        @depenses3 = QuatreDepense.all

        @depenses.each do |dep|
                dep.auto = 0
                dep.save
        end
        @depenses2.each do |dep|
                dep.auto = 0
                dep.save
        end
        @depenses3.each do |dep|
                dep.auto = 0
                dep.save
        end
        puts "Depenses auto mises a zero" 
end





task :month_auto_depenses => :environment do
        desc "Clone toutes les depenses automatiques"


        @autodep2 = Depense.where(:auto => 1)
        @autodep3 = TroisDepense.where(:auto => 1)
        @autodep4 = QuatreDepense.where(:auto => 1)


        @autodep2.each do |auto2|
                @autoclone = Depense.new
                @autoclone.user_id = auto2.user_id
                @autoclone.montant = auto2.montant
                @autoclone.raison = auto2.raison
                @autoclone.destinataire_part2 = auto2.destinataire_part2
                @autoclone.destinataire_part = auto2.destinataire_part
                @autoclone.nbr_users = auto2.nbr_users
                @autoclone.save
        end

        @autodep3.each do |auto3|
                @autoclone = TroisDepense.new
                @autoclone.user_id = auto3.user_id
                @autoclone.montant = auto3.montant
                @autoclone.raison = auto3.raison
                @autoclone.destinataire_part3 = auto3.destinataire_part3
                @autoclone.destinataire_part2 = auto3.destinataire_part2
                @autoclone.destinataire_part = auto3.destinataire_part
                @autoclone.nbr_users = auto3.nbr_users
                @autoclone.save
        end

        @autodep4.each do |auto4|
                @autoclone = QuatreDepense.new
                @autoclone.user_id = auto4.user_id
                @autoclone.montant = auto4.montant
                @autoclone.raison = auto4.raison
                @autoclone.destinataire_part4 = auto4.destinataire_part4
                @autoclone.destinataire_part3 = auto4.destinataire_part3
                @autoclone.destinataire_part2 = auto4.destinataire_part2
                @autoclone.destinataire_part = auto4.destinataire_part
                @autoclone.nbr_users = auto4.nbr_users
                @autoclone.save
        end
        puts "Depenses mensuelles ajoutees" 

end

