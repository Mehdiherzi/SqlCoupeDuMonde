

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


--(3) Obtenir le nom et le prénom des gardiens de but titulaires (numéro de maillot 1) des
--équipes. 

SELECT nome , nom ,prenom 
From joueur j ,equipe e 
where j.nmaillot = 1   AND j.poste= 'GARDIEN DE BUT'  AND e.ne =j.ne ;

--(4)	Obtenir le numéro de maillot, le nom et le prénom des joueurs ayant débuté la finale.
-- cadavre 
SELECT nmaillot , nom , prenom 
From  Match m , joueur j , equipe e1 , equipe e2 ,
where  m.poule = 'final' And  e1.ne =m.ne1   AND  e2.ne =m.ne2 
-- naissance 
SELECT nmaillot , nom , prenom  FROM Match m 
WHERE   m.ne1   IN (SELECT j.ne from joueur j1
                WHERE )
                AND NomCli != 'Emile'; 
where   m.


-- (5) Obtenir les buteurs de l’équipe de France. 

--(6)

--(7)

--(8)

--(9)

--(10)

--(11)









SELECT nmaillot , prenom , nom
FROM joueur , equipe 
where joueur.ne = equipe.ne 
and  joueur.ne ='FRA';

SELECT nmaillot ,prenom ,nom  
From joueur j1 
where j1.poste='ATTAQUANT' AND j1.ne = 'BRA';

SELECT nome , nom ,prenom 
From joueur j ,equipe e 
where j.nmaillot = 1   AND j.poste= 'GARDIEN DE BUT'  AND e.ne =j.ne ;


SELECT nmaillot , nom , prenom 
From  Match m , joueur j , equipe e1 , equipe e2 
where  m.poule = 'final' And  e1.ne =m.ne1  















