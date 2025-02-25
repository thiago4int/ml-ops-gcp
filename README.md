## 1️- Infraestrutura e Orquestração

### **Diferença entre Vertex AI Pipelines e Kubeflow Pipelines na GCP**
O **Vertex AI Pipelines** é uma solução totalmente gerenciada que se integra ao **Vertex AI**, oferecendo **facilidade de uso, escalabilidade automática e segurança** via **IAM e IAP**. Ele é ideal para equipes que **priorizam simplicidade e integração nativa** com serviços da GCP, como **Model Registry, Feature Store e Model Monitoring**.

Por outro lado, o **Kubeflow Pipelines** roda no **GKE** e oferece **maior flexibilidade e controle** sobre a infraestrutura, permitindo **execução multi-cloud e personalização avançada**. É mais adequado para equipes **com experiência em Kubernetes**, que precisam de **controle total sobre os recursos de ML** e desejam integrar serviços personalizados.

### **Infraestrutura escalável para ML na GCP**
Uma infraestrutura escalável combina serviços gerenciados para **garantir eficiência, segurança e otimização de custos**. O fluxo básico inclui:
1. **Armazenamento**: **BigQuery** (estruturado) ou **Cloud Storage** (arquivos, datasets).
2. **Processamento**: **Dataflow** para transformação de dados em larga escala.
3. **Treinamento**: **Vertex AI Training** para execução escalável com suporte a **GPUs/TPUs**.
4. **Registro**: **Model Registry** para versionamento e governança dos modelos.
5. **Inferência**: **Vertex AI Prediction** para modelos gerenciados ou **Cloud Run/GKE** para APIs customizadas.
6. **Monitoramento**: **Vertex AI Model Monitoring** para detecção de **drift, outliers e anomalias**.

A segurança é garantida com **IAM para controle de acessos, VPC Service Controls para isolamento de rede e CMEK para criptografia de dados**.

---

## 2️- CI/CD para Machine Learning

### **Pipeline CI/CD com Cloud Build, Vertex AI e Terraform**
A implementação de uma pipeline CI/CD na GCP envolve:
1. **Treinamento Automatizado**: O **Cloud Build** aciona **Vertex AI Training** e salva o modelo no **Model Registry**.
2. **Validação e Testes**: São realizadas **avaliações automáticas** no modelo antes da implantação.
3. **Implantação**: O modelo é **implantado no Vertex AI Prediction ou em Cloud Run/GKE**, usando **Terraform** para provisionamento automatizado.
4. **Monitoramento e Rollback**: Se **desempenho degradado** for detectado, a pipeline pode **reverter automaticamente para um modelo anterior**.

### **Gerenciamento e rollback no Model Registry**
O **Vertex AI Model Registry** permite versionamento automático e rastreabilidade. Em caso de falhas no modelo recém-implantado, um rollback pode ser feito restaurando a versão anterior no **endpoint de inferência ativo**, garantindo **continuidade do serviço**.

---

## 3️- Monitoramento e Observabilidade

### **Monitoramento de Concept Drift**
O **Vertex AI Model Monitoring** detecta **concept drift e data drift** ao comparar distribuições de dados e predições ao longo do tempo. O fluxo inclui:
1. **Coleta de amostras das predições** e comparação com o conjunto de treinamento.
2. **Análise estatística** de distribuição de features e outputs.
3. **Disparo de alertas via Cloud Monitoring** quando **mudanças significativas** são identificadas.
4. **Ação corretiva automatizada**: **notificação, re-treinamento ou rollback**.

### **Métricas-chave para modelos no Vertex AI**
Monitorar métricas em diferentes categorias garante **performance e confiabilidade**:

| **Categoria**      | **Métricas-chave** |
|-------------------|------------------|
| **Desempenho**   | Latência, Throughput, Tempo de resposta |
| **Precisão**     | Acurácia, Recall, F1-score, RMSE |
| **Drift de dados** | Distribuição de features, Concept drift |
| **Infraestrutura** | Uso de CPU/GPU, Consumo de memória |

Os **alertas do Cloud Monitoring** notificam equipes quando métricas caem abaixo dos limites definidos.

### **Progressive Rollouts e Rollback Automatizado**
A **implantação progressiva (progressive rollout)** reduz riscos, distribuindo o tráfego entre a versão nova e antiga do modelo. Se **o novo modelo apresentar erros ou drifts**, um rollback automático pode ser acionado, garantindo **continuidade do serviço sem impacto significativo**.

---

## 4️- Segurança e Compliance

### **Garantia de segurança e privacidade**
A segurança e privacidade são asseguradas por:
- **Criptografia de dados** via **Cloud KMS e CMEK**.
- **Isolamento de rede** com **VPC Service Controls**.
- **Detecção de informações sensíveis** com **Cloud DLP** (Data Loss Prevention).
- **Gerenciamento de credenciais** via **Workload Identity**, evitando armazenamento de chaves sensíveis.

### **Controle de acesso em pipelines de ML**
A proteção de pipelines de treinamento e inferência inclui:
- **IAM e IAP** para controle de acessos.
- **Separação de ambientes (Dev, Test, Prod)** com diferentes permissões.
- **Auditoria de acessos** via **Cloud Logging e Cloud Audit Logs**.
- **Restrições de origem e permissão granular** no **Cloud Storage e BigQuery**.