CREATE PROCEDURE dbo.TipoInquilinoListar

AS
	BEGIN
		SET NOCOUNT ON



		SELECT 
	Id_TipoInquilino,
	Descripcion,
	Estado 

		FROM	
			dbo.TipoInquilino

			WHERE
					Estado=1






	END