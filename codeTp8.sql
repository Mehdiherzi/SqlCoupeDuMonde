

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

--mort
SELECT j.nom , j.prenom , ne 
From survenir s , joueur j , match m
where s.nj=j.nj and s.na = 'BUT' and ne = 'FRA' and   m.poule = 'Finale'

--vivant

SELECT DISTINCT j.nmaillot ,j.nom , j.prenom , ne 
From survenir s , joueur j , match m 
where s.nj=j.nj and s.na = 'BUT' and ne = 'FRA' and   m.poule = 'Finale' and s.nm = m.nm
ORDER by j.nmaillot


--(7) Obtenir le nom, le prénom et le poste de chaque capitaine par équipe. 

--INSERT INTO Composer (nm, nj, cap) VALUES (seq_match.CURRVAL, (SELECT nj FROM Joueur WHERE nmaillot = 1 AND ne = 'FRA'), 'C');



SELECT DISTINCT  e.nome , j.nom , j.prenom ,j.poste  
from composer c ,equipe e , joueur j
where c.nj =j.nj and  c.cap= 'C' and  e.ne = j.ne
ORDER BY e.nome 

--(8) Calculer le nombre d’attaquants par équipes (classées de la plus offensive à la plus
--défensive).
-- mort 
SELECT  e.nome , count(j.poste)
From joueur j ,equipe e 
where j.poste='ATTAQUANT' and j.ne= e.ne


-- mort
SELECT count(e.ne )
From equipe  e 
group by  e.ne 
where  e.ne = 'FRA'



--8  vivant 

SELECT e.nome,count(j.ne)
From joueur j,equipe e
where   e.ne = j.ne  
      and j.poste ='ATTAQUANT'
group by e.nome
order by count(j.ne) desc ;





--(9)

select  j.nmaillot, j.nom , j.prenom ,  count(j.ne) as "NBBUTS"  
From survenir s , joueur j 
where s.nj = j.nj 
and s.na = 'BUT'
group by j.nom ,j.nmaillot,j.prenom ;


--(10)

SELECT j.nmaillot , j.nom , j.prenom 
FROM joueur j  , survenir s
WHERE j.nj = s.nj
      and  s.na = 'BUT'
GROUP by j.nmaillot , j.nom , j.prenom 
HAVING  count(s.na)= (select max(count(s.na)) as "Nbb"
                     from survenir s 
                     where  s.na = 'BUT' -- c'est les action que  nous decomposer 
                     group by s.nj ); --  on veux le nombre de but pars joueur 



--(11)


SELECT e.nome 
FROM joueur j  , survenir s ,equipe e 
WHERE j.nj = s.nj
      and j.ne = e.ne 
      and  s.na = 'BUT'
GROUP by  e.nome 
HAVING  count(s.na) =  (select max(count(s.na))
                        from survenir s , joueur j ,equipe e
                        where s.nj = j.nj
                              and j.ne = e.ne
                              and s.na = 'BUT'
                        group by e.ne);






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
















