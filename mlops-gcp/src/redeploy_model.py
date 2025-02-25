from google.cloud import aiplatform
import functions_framework

@functions_framework.cloud_event
def redeploy_model(cloud_event):
    data = cloud_event.data
    model_id = data.get("modelId")

    if not model_id:
        print("Nenhum modelo foi especificado para reimplantação.")
        return
    
    print(f"Reimplantando modelo: {model_id}")

    model = aiplatform.Model(model_id)
    model.deploy(machine_type="n1-standard-4", min_replica_count=1, max_replica_count=2)

    print(f"Modelo {model_id} reimplantado com sucesso!")