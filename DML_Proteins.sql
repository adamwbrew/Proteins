USE master;
GO

USE Proteins;
GO

-- Instert statements

INSERT INTO Biotin(Biotin_Label)
    SELECT DISTINCT Biotin
    FROM master.dbo.proteins_identifiers_denormalized

INSERT INTO Virus(Virus_Label)
    SELECT DISTINCT Virus
    FROM master.dbo.proteins_identifiers_denormalized

INSERT INTO Fraction(Fraction_Label)
    SELECT DISTINCT Fraction
    FROM master.dbo.proteins_identifiers_denormalized

INSERT INTO Mouse(Sample_Name, Biotin_ID, Virus_ID, Fraction_ID)
    SELECT DISTINCT 
        Sample_Name, 
        B.Biotin_ID, 
        V.Virus_ID, 
        F.Fraction_ID
    FROM master.dbo.proteins_identifiers_denormalized AS PI
    INNER JOIN Biotin AS B ON PI.Biotin = B.Biotin_Label
    INNER JOIN Virus AS V ON PI.Virus = V.Virus_Label
    INNER JOIN Fraction AS F ON PI.Fraction = F.Fraction_Label


INSERT INTO Protein_Id(Protein_Id_Label)
    SELECT DISTINCT Protein_Ids
    FROM master.dbo.proteins_denormalized

INSERT INTO Gene(Gene_Label)
    SELECT DISTINCT Genes
    FROM master.dbo.proteins_denormalized

INSERT INTO Protein_Description([Description])
    SELECT DISTINCT First_Protein_Description
    FROM master.dbo.proteins_denormalized

INSERT INTO Peptide(Peptide_Amount)
    SELECT DISTINCT Peptides
    FROM master.dbo.proteins_denormalized

INSERT INTO Protein(Protein_Name, Protein_Group, Protein_Id_ID, Gene_ID, Description_ID, Peptide_ID)
    SELECT DISTINCT 
        P.Protein_Names,
        P.Protein_Group,
        PI.Protein_Id_ID,
        G.Gene_ID,
        PD.Description_ID,
        PE.Peptide_ID
    FROM master.dbo.proteins_denormalized AS P
    INNER JOIN Protein_Id AS PI ON P.Protein_Ids = PI.Protein_Id_Label
    INNER JOIN Gene AS G ON P.Genes = G.Gene_Label
    INNER JOIN Protein_Description AS PD ON P.First_Protein_Description = PD.[Description]
    INNER JOIN Peptide AS PE ON P.Peptides = PE.Peptide_Amount

INSERT INTO Mouse_Protein(Protein_ID, Mouse_ID, Hits)
    SELECT DISTINCT
        P.Protein_ID, 
        M.Mouse_ID, 
        MP.Hits
    FROM master.dbo.mouse_by_protein AS MP
    INNER JOIN Protein AS P ON MP.Protein_Names = P.Protein_Name
    INNER JOIN Mouse AS M ON MP.Sample_Name = M.Sample_Name