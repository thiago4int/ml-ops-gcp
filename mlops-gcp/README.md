# Pipeline de MLOps na GCP para Previsão de Demanda

Este projeto implementa um pipeline automatizado de MLOps na Google Cloud Platform (GCP) para previsão de demanda de vendas. O pipeline inclui treinamento, implantação e monitoramento de modelos de machine learning, com foco em segurança, escalabilidade e automação.

## **Arquiteturas**

### **Arquitetura Funcional**
1. **Cloud Storage**: Armazena datasets e modelos.
2. **Cloud Composer (Apache Airflow)**: Orquestra o pipeline de ETL e ML.
3. **Vertex AI**: Treina e implanta o modelo.
4. **Cloud Functions**: Reimplanta o modelo automaticamente.
5. **Cloud Logging & Monitoring**: Monitora logs e métricas.
6. **Pub/Sub**: Envia alertas em caso de problemas.
7. **Secret Manager + KMS**: Gerencia segredos e encriptação.

### **Arquitetura de Negócios**
1. **Entrada**: Dados históricos de vendas.
2. **Processamento**: Pipeline de ETL e treinamento de modelos.
3. **Saída**: Previsões de demanda para otimização de estoque.
4. **Benefícios**: Redução de custos, estoques otimizados e decisões baseadas em dados.

## **Estrutura do Repositório**

```plaintext
mlops-gcp/
├── infra/                  # Código Terraform para provisionamento
│   ├── main.tf             # Configuração principal
│   ├── variables.tf        # Variáveis do Terraform
│   ├── outputs.tf          # Saídas do Terraform
│   └── providers.tf        # Configuração dos providers
├── src/                    # Código Python
│   ├── train_model.py      # Script de treinamento do modelo
│   ├── redeploy_model.py   # Cloud Function para reimplante
│   └── requirements.txt    # Dependências Python
├── scripts/                # Scripts utilitários
│   └── setup_repo.sh       # Shell script para criar a estrutura
├── cloudbuild.yaml         # Pipeline de CI/CD no Cloud Build
├── README.md               # Documentação do projeto
└── .gitignore              # Arquivos ignorados pelo Git
```

## **Comandos de Implementação e Execução**

1. **Criar Estrutura de Pastas**:
   ```bash
   bash scripts/setup_repo.sh
   ```

2. **Provisionar Infraestrutura com Terraform**:
   ```bash
   cd infra
   terraform init
   terraform apply -auto-approve
   ```

3. **Executar o Pipeline de Treinamento**:
   ```bash
   python src/train_model.py
   ```

4. **Configurar CI/CD com Cloud Build**:
   ```bash
   gcloud builds submit --config cloudbuild.yaml
   ```

5. **Monitorar o Pipeline**:
   - Acesse o **Cloud Logging** e **Cloud Monitoring** para ver logs e métricas.

## **Próximos Passos**
1. Adicionar testes unitários e de integração.
2. Implementar rollback automático em caso de falhas.
3. Documentar detalhes de monitoramento e alertas.
```

---

## **Script de Criação de Pastas e Arquivos (`scripts/setup_repo.sh`)**

```bash
#!/bin/bash

# Cria a estrutura de pastas
mkdir -p mlops-gcp/{infra,src,scripts}

# Cria arquivos principais
touch mlops-gcp/infra/{main.tf,variables.tf,outputs.tf,providers.tf}
touch mlops-gcp/src/{train_model.py,redeploy_model.py,requirements.txt}
touch mlops-gcp/cloudbuild.yaml
touch mlops-gcp/scripts/setup_repo.sh
touch mlops-gcp/{README.md,.gitignore}

# Adiciona permissão de execução ao script
chmod +x mlops-gcp/scripts/setup_repo.sh

echo "Estrutura do repositório criada com sucesso!"
```

---

## **Arquitetura Funcional**


1. **Cloud Storage**: Armazena datasets e modelos.
2. **Cloud Composer**: Orquestra o pipeline de ETL e ML.
3. **Vertex AI**: Treina e implanta o modelo.
4. **Cloud Functions**: Reimplanta o modelo automaticamente.
5. **Secret Manager + KMS**: Gerencia segredos e encriptação.
6. **Cloud Logging & Monitoring**: Monitora logs e métricas.
7. **Pub/Sub**: Envia alertas em caso de problemas.

---

## **Arquitetura de Negócios**


1. **Entrada**: Dados históricos de vendas.
2. **Processamento**:
   - Pipeline de ETL.
   - Treinamento de modelos.
3. **Saída**: Previsões de demanda para otimização de estoque.
4. **Benefícios**:
   - Redução de custos.
   - Estoque otimizado.
   - Decisões baseadas em dados.

---

---

## **Comandos de Implementação e Execução**

### **1. Criar Estrutura de Pastas**
```bash
bash scripts/setup_repo.sh
```

### **2. Provisionar Infraestrutura com Terraform**
```bash
cd infra
terraform init
terraform apply -auto-approve
```

### **3. Executar o Pipeline de Treinamento**
```bash
python src/train_model.py
```

### **4. Configurar CI/CD com Cloud Build**
```bash
gcloud builds submit --config cloudbuild.yaml
```

### **5. Monitorar o Pipeline**
- Acesse o **Cloud Logging** e **Cloud Monitoring** para ver logs e métricas.
