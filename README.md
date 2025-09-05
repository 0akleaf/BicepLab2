# BicepLab2 – Snabbstart

## Skapa resurser i en befintlig Resource Group

1. **Öppna terminalen i mappen `src`.**

2. **Kör deployment med önskad parameterfil:**

```sh
az deployment group create --resource-group <din-resource-group> --template-file Modules/main.bicep --parameters Parameters/dev.json
```

_Byt ut `dev.json` mot `test.json` eller `prod.json` för andra miljöer._

3. **Web App URL visas som output efter deployment.**