

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
From joueur j1 
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

-- mort
SELECT nmaillot , nom , prenom  FROM Match m  , joueur 
WHERE   m.ne1   IN (SELECT j1.ne from joueur j1
                    WHERE m.poule = 'Finale ')           
Where   m.ne2   IN (SELECT j2.ne from joueur j2
                   WHERE m.poule = 'Finale ' )


--mort
--SELECT nmaillot , nom , prenom , nome  FROM   joueur , match m
WHERE( m.ne1 IN (SELECT e1.ne  from equipe e1 where m.poule='Finale'))
   -- ANd( m.ne2 IN (SELECT e2.ne  from equipe e2 , match m where m.poule='Finale'))) 
    


--born


--INSERT INTO Composer (nm, nj, cap) VALUES (seq_match.CURRVAL, (SELECT nj FROM Joueur WHERE nmaillot = 1 AND ne = 'FRA'), 'C');
--INSERT INTO Match (nm, dtm, stade, ville, poule, ne1, score1, score2, ne2)
--VALUES (seq_match.NEXTVAL, TO_DATE('15 juil. 2018 - 18:00', 'DD MONTH YYYY - HH24:MI', 'NLS_DATE_LANGUAGE = french'), 'Stade Loujniki', 'Moscou', 'Finale', 'FRA', 4, 2, 'CRO');
--COMMIT;

--(4)	Obtenir le numéro de maillot, le nom et le prénom des joueurs ayant débuté la finale.
--vivant 
 SELECT nmaillot, nom , prenom 
 from  joueur j , match m , composer c
 where m.poule = 'Finale' and c.nj= j.nj and m.nm = c.nm  


-- (5) Obtenir les buteurs de l’équipe de France. 

--INSERT INTO Survenir (nm, tps, nj, na) VALUES (seq_match.CURRVAL, '31', (SELECT nj FROM Joueur WHERE nmaillot = 6 AND ne = 'RUS'), 'BUT');
--INSERT INTO Joueur (nj, nmaillot, prenom, nom, poste, age, ne) VALUES (seq_joueur.NEXTVAL, 20, 'Johan', 'DJOUROU', 'DÉFENSEUR', 31, 'SUI');
--mort
Select  nom, prenom , ne 
From survenir s , joueur j 
where s.nj=j.nj and s.na = 'BUT'
-- vivant 
Select DISTINCT j.nom, j.prenom , ne 
From survenir s , joueur j 
where s.nj=j.nj and s.na = 'BUT' and ne = 'FRA';  



--(6) Obtenir les buteurs de l’équipe de France en finale.


--(7) Obtenir le nom, le prénom et le poste de chaque capitaine par équipe. 

--(8) Calculer le nombre d’attaquants par équipes (classées de la plus offensive à la plus
--défensive). 


--(9)

--(10)

--(11)







-- sauve => 

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















