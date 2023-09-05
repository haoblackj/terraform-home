# terraform-home
1.  Terraformのインストール
`https://developer.hashicorp.com/terraform/downloads`

1.  proxmoxのトークンIDとトークンシークレット、APIURLをBitwardenから取得し、下記のコマンドで環境変数に投入する
```
export PM_API_TOKEN_ID='<トークンID>'
export PM_API_TOKEN_SECRET='<トークンシークレット>'
export PM_API_URL='<ProxmoxURL>/api2/json'
```