{{/*
Files starting with "_" are never rendered into objects; they only hold named templates.
*/}}

{{/* Selector labels: used by the Deployment selector AND the Service selector.
     Never change them after install: a Deployment selector is immutable. */}}
{{- define "shopmesh-app.selectorLabels" -}}
app: {{ .Release.Name }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}

{{/* Common labels: selector labels + information about the chart and version. */}}
{{- define "shopmesh-app.labels" -}}
{{ include "shopmesh-app.selectorLabels" . }}
app.kubernetes.io/name: {{ .Chart.Name }}
app.kubernetes.io/version: {{ .Values.image.tag | quote }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
helm.sh/chart: {{ .Chart.Name }}-{{ .Chart.Version }}
{{- end }}
