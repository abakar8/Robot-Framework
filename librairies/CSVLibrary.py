import pandas as pd

class CSVLibrary:
    def get_employee_data_by_index(self, path, index):
        """Retourne une ligne d'employé sous forme de dictionnaire."""
        try:
            df = pd.read_csv(path)
            if index >= len(df):
                raise IndexError(f"Index {index} hors limite.")
            return df.iloc[index].to_dict()
        except Exception as e:
            raise RuntimeError(f"Erreur lecture CSV : {e}")
