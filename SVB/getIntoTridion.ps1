Add-Type -assemblyName System.ServiceModel

$binding = new-object System.ServiceModel.WsHttpBinding

$binding.MaxBufferPoolSize = [int]::MaxValue

$binding.MaxReceivedMessageSize = [int]::MaxValue

$binding.ReaderQuotas.MaxArrayLength = [int]::MaxValue

$binding.ReaderQuotas.MaxBytesPerRead = [int]::MaxValue

$binding.ReaderQuotas.MaxNameTableCharCount = [int]::MaxValue

$binding.ReaderQuotas.MaxStringContentLength = [int]::MaxValue

$endpoint = new-object System.ServiceModel.EndpointAddress http://app0503/webservices/CoreService201603.svc/wsHttp

Add-Type -Path '\\svb.org\users$\AVHome$\avgibeag\Documents\WindowsPowerShell\Modules\Tridion-CoreService\Clients\Tridion.ContentManager.CoreService.Client.Web_8_5.dll'

$core = new-object Tridion.ContentManager.CoreService.Client.SessionAwareCoreServiceClient $binding,$endpoint 