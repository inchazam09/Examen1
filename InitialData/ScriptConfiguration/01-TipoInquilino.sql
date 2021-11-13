DROP TABLE IF EXISTS #TipoInquilinoTemp

SELECT 
Id_TipoInquilino, Descripcion, Estado INTO #TipoInquilinoTemp
FROM (
VALUES
(1, 'FISICO'),
(2, 'JURIDICO')
)AS TEMP (Id_TipoInquilino, Descripcion, Estado)


----ACTUALIZAR DATOS---
UPDATE T SET
  T.Descripcion= T.NombreProvincia,
  T.Estado= T.Estado
FROM Dbo.TipoInquilino T
INNER JOIN #TipoInquilinoTemp T
    ON P.Id_TipoInquilino= TI.Id_TipoInquilino


----INSERTAR DATOS---

SET IDENTITY_INSERT dbo.TipoInquilino ON

INSERT INTO dbo.TipoInquilino(
Id_TipoInquilino, Descripcion, Estado)
SELECT
Id_TipoInquilino, Descripcion, Estado
FROM #TipoInquilinoTemp


EXCEPT
SELECT
Id_TipoInquilino, Descripcion, Estado
FROM dbo.TipoInquilino


SET IDENTITY_INSERT dbo.TipoInquilino OFF

GO