# terraform-home
1.  Terraformのインストール
`https://developer.hashicorp.com/terraform/downloads`

1.  proxmoxのトークンIDとトークンシークレット、APIURLをBitwardenから取得し、下記のコマンドで環境変数に投入する
```
export pm_api_token_id='<トークンID>'
export pm_api_token_secret='<トークンシークレット>'
export pm_api_url='<ProxmoxURL>/api2/json'
```