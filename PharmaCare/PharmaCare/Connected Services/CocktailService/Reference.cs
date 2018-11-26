﻿//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated by a tool.
//     Runtime Version:4.0.30319.42000
//
//     Changes to this file may cause incorrect behavior and will be lost if
//     the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace PharmaCare.CocktailService {
    
    
    [System.CodeDom.Compiler.GeneratedCodeAttribute("System.ServiceModel", "4.0.0.0")]
    [System.ServiceModel.ServiceContractAttribute(ConfigurationName="CocktailService.ICocktailService")]
    public interface ICocktailService {
        
        [System.ServiceModel.OperationContractAttribute(Action="http://tempuri.org/ICocktailService/checkCocktail", ReplyAction="http://tempuri.org/ICocktailService/checkCocktailResponse")]
        bool checkCocktail(string drugs);
        
        [System.ServiceModel.OperationContractAttribute(Action="http://tempuri.org/ICocktailService/checkCocktail", ReplyAction="http://tempuri.org/ICocktailService/checkCocktailResponse")]
        System.Threading.Tasks.Task<bool> checkCocktailAsync(string drugs);
    }
    
    [System.CodeDom.Compiler.GeneratedCodeAttribute("System.ServiceModel", "4.0.0.0")]
    public interface ICocktailServiceChannel : PharmaCare.CocktailService.ICocktailService, System.ServiceModel.IClientChannel {
    }
    
    [System.Diagnostics.DebuggerStepThroughAttribute()]
    [System.CodeDom.Compiler.GeneratedCodeAttribute("System.ServiceModel", "4.0.0.0")]
    public partial class CocktailServiceClient : System.ServiceModel.ClientBase<PharmaCare.CocktailService.ICocktailService>, PharmaCare.CocktailService.ICocktailService {
        
        public CocktailServiceClient() {
        }
        
        public CocktailServiceClient(string endpointConfigurationName) : 
                base(endpointConfigurationName) {
        }
        
        public CocktailServiceClient(string endpointConfigurationName, string remoteAddress) : 
                base(endpointConfigurationName, remoteAddress) {
        }
        
        public CocktailServiceClient(string endpointConfigurationName, System.ServiceModel.EndpointAddress remoteAddress) : 
                base(endpointConfigurationName, remoteAddress) {
        }
        
        public CocktailServiceClient(System.ServiceModel.Channels.Binding binding, System.ServiceModel.EndpointAddress remoteAddress) : 
                base(binding, remoteAddress) {
        }
        
        public bool checkCocktail(string drugs) {
            return base.Channel.checkCocktail(drugs);
        }
        
        public System.Threading.Tasks.Task<bool> checkCocktailAsync(string drugs) {
            return base.Channel.checkCocktailAsync(drugs);
        }
    }
}