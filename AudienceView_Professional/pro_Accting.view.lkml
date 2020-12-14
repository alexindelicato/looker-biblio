view: pro_Accting {

   derived_table: {
     sql: SELECT 'Credit' Accting
          UNION ALL
          SELECT 'Debit' Accting;;
   }

   # Define your dimensions and measures here, like this:
   dimension: Accting {
     description: "Accting"
     type: string
   }
 }
