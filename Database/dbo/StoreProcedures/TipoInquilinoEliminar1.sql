﻿CREATE PROCEDURE [dbo].[TipoInquilinoEliminar]
 @Id_TipoInquilino int


AS BEGIN
SET NOCOUNT ON

  BEGIN TRANSACTION TRASA

    BEGIN TRY
            DELETE FROM exp.TipoInquilino WHERE Id_TipoInquilino=@Id_TipoInquilino
	
	  COMMIT TRANSACTION TRASA
	  SELECT 0 AS CodeError, '' AS MsgError

  END TRY

  BEGIN CATCH

	   SELECT 
			 ERROR_NUMBER() AS CodeError,
			 ERROR_MESSAGE() AS MsgError
   
	   ROLLBACK TRANSACTION TRASA

   END CATCH

 END