

---------------------------------------------------------
-- TP8    
---------------------------------------------------------
-- (1)
-- triche 
SELECT  nmaillot , prenom ,  nom
FROM  joueur
where  ne = 'FRA'
order by nmaillot ; 

-- comme explique  en cour 

SELECT nmaillot , prenom , nom
FROM joueur , equipe 
where joueur.ne = equipe.ne 
and  joueur.ne ='FRA';


--(2) Obtenir le numéro de maillot, le nom et le prénom des attaquants de l’équipe du
-- Brésil. 

SELECT nmaillot , nom ,prenom  
From joueur j1 , 
where j1.poste='ATTAQUANT' AND j1.ne = 'BRA'
