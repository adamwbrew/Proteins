USE master;
GO

USE Proteins;
GO


-- Query of all data
-- 15 smaples multiplied by 5883 proteins equals 88245 rows
SELECT 
    PI.Protein_Id_Label,
    G.Gene_Label,
    PD.[Description],
    PE.Peptide_Amount,
    P.Protein_Name,
    P.Protein_Group,
    V.Virus_Label,
    B.Biotin_Label,
    F.Fraction_Label,
    M.Sample_Name,
    MP.Hits
FROM Mouse_Protein AS MP 
INNER JOIN Mouse AS M on MP.Mouse_ID = M.Mouse_ID
INNER JOIN Protein AS P on MP.Protein_ID = P.Protein_ID
INNER JOIN Virus AS V on M.Virus_ID = V.Virus_ID
INNER JOIN Biotin AS B on M.Biotin_ID = B.Biotin_ID
INNER JOIN Fraction AS F on M.Fraction_ID = F.Fraction_ID
INNER JOIN Protein_Id AS PI on P.Protein_Id_ID = PI.Protein_Id_ID
INNER JOIN Gene AS G on P.Gene_ID = G.Gene_ID
INNER JOIN Protein_Description AS PD on P.Description_ID = PD.Description_ID
INNER JOIN Peptide AS PE on P.Peptide_ID = PE.Peptide_ID


-- Query specific data by descending number of hits
SELECT 
    MP.Hits,
    M.Sample_Name,
    F.Fraction_Label,
    PE.Peptide_Amount,
    P.Protein_Name,
    V.Virus_Label,
    B.Biotin_Label
FROM Mouse_Protein AS MP 
INNER JOIN Mouse AS M on MP.Mouse_ID = M.Mouse_ID
INNER JOIN Protein AS P on MP.Protein_ID = P.Protein_ID
INNER JOIN Virus AS V on M.Virus_ID = V.Virus_ID
INNER JOIN Biotin AS B on M.Biotin_ID = B.Biotin_ID
INNER JOIN Fraction AS F on M.Fraction_ID = F.Fraction_ID
INNER JOIN Protein_Id AS PI on P.Protein_Id_ID = PI.Protein_Id_ID
INNER JOIN Gene AS G on P.Gene_ID = G.Gene_ID
INNER JOIN Protein_Description AS PD on P.Description_ID = PD.Description_ID
INNER JOIN Peptide AS PE on P.Peptide_ID = PE.Peptide_ID
ORDER BY MP.Hits DESC


-- Query specific data by descending number of total hits grouped by fraction
SELECT 
    SUM(MP.Hits) AS Hits,
    F.Fraction_Label
FROM Mouse_Protein AS MP 
INNER JOIN Mouse AS M on MP.Mouse_ID = M.Mouse_ID
INNER JOIN Protein AS P on MP.Protein_ID = P.Protein_ID
INNER JOIN Virus AS V on M.Virus_ID = V.Virus_ID
INNER JOIN Biotin AS B on M.Biotin_ID = B.Biotin_ID
INNER JOIN Fraction AS F on M.Fraction_ID = F.Fraction_ID
INNER JOIN Protein_Id AS PI on P.Protein_Id_ID = PI.Protein_Id_ID
INNER JOIN Gene AS G on P.Gene_ID = G.Gene_ID
INNER JOIN Protein_Description AS PD on P.Description_ID = PD.Description_ID
INNER JOIN Peptide AS PE on P.Peptide_ID = PE.Peptide_ID
GROUP BY Fraction_Label
ORDER BY Hits DESC

-- Query the total number of hits grouped by protein, fraction, and sample type.
SELECT 
    P.Protein_Name,
    F.Fraction_Label,
    M.Sample_Name,
    SUM(MP.Hits) AS Hits
FROM Mouse_Protein AS MP 
INNER JOIN Mouse AS M on MP.Mouse_ID = M.Mouse_ID
INNER JOIN Protein AS P on MP.Protein_ID = P.Protein_ID
INNER JOIN Virus AS V on M.Virus_ID = V.Virus_ID
INNER JOIN Biotin AS B on M.Biotin_ID = B.Biotin_ID
INNER JOIN Fraction AS F on M.Fraction_ID = F.Fraction_ID
INNER JOIN Protein_Id AS PI on P.Protein_Id_ID = PI.Protein_Id_ID
INNER JOIN Gene AS G on P.Gene_ID = G.Gene_ID
INNER JOIN Protein_Description AS PD on P.Description_ID = PD.Description_ID
INNER JOIN Peptide AS PE on P.Peptide_ID = PE.Peptide_ID
GROUP BY F.Fraction_Label, P.Protein_Name, M.Sample_Name
ORDER BY Hits DESC


-- Query the total number of hits grouped by protein type.
SELECT 
    P.Protein_Name,
    SUM(MP.Hits) AS Hits
FROM Mouse_Protein AS MP 
INNER JOIN Mouse AS M on MP.Mouse_ID = M.Mouse_ID
INNER JOIN Protein AS P on MP.Protein_ID = P.Protein_ID
INNER JOIN Virus AS V on M.Virus_ID = V.Virus_ID
INNER JOIN Biotin AS B on M.Biotin_ID = B.Biotin_ID
INNER JOIN Fraction AS F on M.Fraction_ID = F.Fraction_ID
INNER JOIN Protein_Id AS PI on P.Protein_Id_ID = PI.Protein_Id_ID
INNER JOIN Gene AS G on P.Gene_ID = G.Gene_ID
INNER JOIN Protein_Description AS PD on P.Description_ID = PD.Description_ID
INNER JOIN Peptide AS PE on P.Peptide_ID = PE.Peptide_ID
GROUP BY P.Protein_Name
ORDER BY Hits DESC