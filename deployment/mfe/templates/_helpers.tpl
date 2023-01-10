{{/*
Expand the name of the chart.
*/}}
{{- define "mfe.container.name" -}}
{{- default "mfe-container" | trunc 63 | trimSuffix "-" }}
{{- end }}

{{- define "mfe.app1.name" -}}
{{- default "mfe-app1" | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Create a default fully qualified app name.
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
If release name contains chart name it will be used as a full name.
*/}}
{{- define "mfe.container.fullname" -}}
{{- $name := "mfe-container" }}
{{- if contains $name .Release.Name }}
{{- .Release.Name | trunc 63 | trimSuffix "-" }}
{{- else }}
{{- printf "%s-%s" .Release.Name $name | trunc 63 | trimSuffix "-" }}
{{- end }}
{{- end }}

{{- define "mfe.app1.fullname" -}}
{{- $name := "mfe-app1" }}
{{- if contains $name .Release.Name }}
{{- .Release.Name | trunc 63 | trimSuffix "-" }}
{{- else }}
{{- printf "%s-%s" .Release.Name $name | trunc 63 | trimSuffix "-" }}
{{- end }}
{{- end }}

{{/*
Create chart name and version as used by the chart label.
*/}}
{{- define "mfe.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}

{{- define "mfe.nginx-config" -}}
server {
  listen 80;
  {{ range .rewrites }}
  location {{ .location }} {
    rewrite {{ .rewrite.source }} {{ .rewrite.dest }}  break;
    proxy_pass      {{ .proxy_pass }};
  }
  {{end }}
  location / {
    root   /usr/share/nginx/html;
    index  index.html index.htm;
    try_files $uri $uri/ /index.html;
  }

  error_page   500 502 503 504  /50x.html;

  location = /50x.html {
    root   /usr/share/nginx/html;
  }

}
{{- end -}}

