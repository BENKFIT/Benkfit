package spring.mvc.benkfit.sol;

import io.reactivex.Flowable;
import java.math.BigInteger;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collections;
import java.util.List;
import org.web3j.abi.EventEncoder;
import org.web3j.abi.TypeReference;
import org.web3j.abi.datatypes.Address;
import org.web3j.abi.datatypes.DynamicBytes;
import org.web3j.abi.datatypes.Event;
import org.web3j.abi.datatypes.Function;
import org.web3j.abi.datatypes.Type;
import org.web3j.abi.datatypes.generated.Uint256;
import org.web3j.crypto.Credentials;
import org.web3j.protocol.Web3j;
import org.web3j.protocol.core.DefaultBlockParameter;
import org.web3j.protocol.core.RemoteCall;
import org.web3j.protocol.core.methods.request.EthFilter;
import org.web3j.protocol.core.methods.response.Log;
import org.web3j.protocol.core.methods.response.TransactionReceipt;
import org.web3j.tx.Contract;
import org.web3j.tx.TransactionManager;
import org.web3j.tx.gas.ContractGasProvider;

/**
 * <p>Auto generated code.
 * <p><strong>Do not modify!</strong>
 * <p>Please use the <a href="https://docs.web3j.io/command_line.html">web3j command line tools</a>,
 * or the org.web3j.codegen.SolidityFunctionWrapperGenerator in the 
 * <a href="https://github.com/web3j/web3j/tree/master/codegen">codegen module</a> to update.
 *
 * <p>Generated with web3j version 4.1.1.
 */
public class Basic extends Contract {
    private static final String BINARY = "608060405260008054600160a060020a03191633179055610337806100256000396000f3fe608060405260043610610045577c010000000000000000000000000000000000000000000000000000000060003504630a4e6203811461004a578063a97128da14610084575b600080fd5b6100706004803603602081101561006057600080fd5b5035600160a060020a031661008c565b604080519115158252519081900360200190f35b6100706101b7565b60008054600160a060020a031633146100a457600080fd5b600054600160a060020a03838116911614156100bf57600080fd5b6001805473ffffffffffffffffffffffffffffffffffffffff1916600160a060020a0384161790557f4c1b8f9de092049cbb46947a708b637a547cebbcdd319a155b148bbc255cd71160003633345a60408051600160a060020a038516602082015290810183905260608101829052608080825281018590528060a08101878780828437600083820152604051601f909101601f19169092018290039850909650505050505050a160015460408051600160a060020a038086168252909216602083015280517f39c36afdb04e03728854072650d1cd6da6fc875ef10b534b0add54907d2124e79281900390910190a1506001919050565b60008054600160a060020a031633146101cf57600080fd5b600034116101dc57600080fd5b600154600054600160a060020a03908116911614156101fa57600080fd5b600154604051600160a060020a03909116903480156108fc02916000818181858888f19350505050158015610233573d6000803e3d6000fd5b507f4c1b8f9de092049cbb46947a708b637a547cebbcdd319a155b148bbc255cd71160003633345a60408051600160a060020a038516602082015290810183905260608101829052608080825281018590528060a08101878780828437600083820152604051601f909101601f19169092018290039850909650505050505050a160005460015460408051600160a060020a039384168152919092166020820152348183015290517fb0cde5f38a1361ad12675f2d74c499d1ca3957aeb63669ec2eff6f284c1ead9e9181900360600190a15060019056fea165627a7a723058204c0c02ce101bf24d4ece8198ea3d4e4f88d07e75b2bc5ad5136938df2723bdf30029";

    public static final String FUNC_ADDRESSSET = "addressSet";

    public static final String FUNC_VALUETRANSFER = "valueTransfer";

    public static final Event INFOLOG_EVENT = new Event("infoLog", 
            Arrays.<TypeReference<?>>asList(new TypeReference<DynamicBytes>() {}, new TypeReference<Address>() {}, new TypeReference<Uint256>() {}, new TypeReference<Uint256>() {}));
    ;

    public static final Event ADDRESSSETLOG_EVENT = new Event("addressSetLog", 
            Arrays.<TypeReference<?>>asList(new TypeReference<Address>() {}, new TypeReference<Address>() {}));
    ;

    public static final Event VALUETRANSFERLOG_EVENT = new Event("valueTransferLog", 
            Arrays.<TypeReference<?>>asList(new TypeReference<Address>() {}, new TypeReference<Address>() {}, new TypeReference<Uint256>() {}));
    ;

    @Deprecated
    protected Basic(String contractAddress, Web3j web3j, Credentials credentials, BigInteger gasPrice, BigInteger gasLimit) {
        super(BINARY, contractAddress, web3j, credentials, gasPrice, gasLimit);
    }

    protected Basic(String contractAddress, Web3j web3j, Credentials credentials, ContractGasProvider contractGasProvider) {
        super(BINARY, contractAddress, web3j, credentials, contractGasProvider);
    }

    @Deprecated
    protected Basic(String contractAddress, Web3j web3j, TransactionManager transactionManager, BigInteger gasPrice, BigInteger gasLimit) {
        super(BINARY, contractAddress, web3j, transactionManager, gasPrice, gasLimit);
    }

    protected Basic(String contractAddress, Web3j web3j, TransactionManager transactionManager, ContractGasProvider contractGasProvider) {
        super(BINARY, contractAddress, web3j, transactionManager, contractGasProvider);
    }

    public RemoteCall<TransactionReceipt> addressSet(String _to, BigInteger weiValue) {
        final Function function = new Function(
                FUNC_ADDRESSSET, 
                Arrays.<Type>asList(new org.web3j.abi.datatypes.Address(_to)), 
                Collections.<TypeReference<?>>emptyList());
        return executeRemoteCallTransaction(function, weiValue);
    }

    public RemoteCall<TransactionReceipt> valueTransfer(BigInteger weiValue) {
        final Function function = new Function(
                FUNC_VALUETRANSFER, 
                Arrays.<Type>asList(), 
                Collections.<TypeReference<?>>emptyList());
        return executeRemoteCallTransaction(function, weiValue);
    }

    public List<InfoLogEventResponse> getInfoLogEvents(TransactionReceipt transactionReceipt) {
        List<Contract.EventValuesWithLog> valueList = extractEventParametersWithLog(INFOLOG_EVENT, transactionReceipt);
        ArrayList<InfoLogEventResponse> responses = new ArrayList<InfoLogEventResponse>(valueList.size());
        for (Contract.EventValuesWithLog eventValues : valueList) {
            InfoLogEventResponse typedResponse = new InfoLogEventResponse();
            typedResponse.log = eventValues.getLog();
            typedResponse._data = (byte[]) eventValues.getNonIndexedValues().get(0).getValue();
            typedResponse._sender = (String) eventValues.getNonIndexedValues().get(1).getValue();
            typedResponse._value = (BigInteger) eventValues.getNonIndexedValues().get(2).getValue();
            typedResponse._gas = (BigInteger) eventValues.getNonIndexedValues().get(3).getValue();
            responses.add(typedResponse);
        }
        return responses;
    }

    public Flowable<InfoLogEventResponse> infoLogEventFlowable(EthFilter filter) {
        return web3j.ethLogFlowable(filter).map(new io.reactivex.functions.Function<Log, InfoLogEventResponse>() {
            @Override
            public InfoLogEventResponse apply(Log log) {
                Contract.EventValuesWithLog eventValues = extractEventParametersWithLog(INFOLOG_EVENT, log);
                InfoLogEventResponse typedResponse = new InfoLogEventResponse();
                typedResponse.log = log;
                typedResponse._data = (byte[]) eventValues.getNonIndexedValues().get(0).getValue();
                typedResponse._sender = (String) eventValues.getNonIndexedValues().get(1).getValue();
                typedResponse._value = (BigInteger) eventValues.getNonIndexedValues().get(2).getValue();
                typedResponse._gas = (BigInteger) eventValues.getNonIndexedValues().get(3).getValue();
                return typedResponse;
            }
        });
    }

    public Flowable<InfoLogEventResponse> infoLogEventFlowable(DefaultBlockParameter startBlock, DefaultBlockParameter endBlock) {
        EthFilter filter = new EthFilter(startBlock, endBlock, getContractAddress());
        filter.addSingleTopic(EventEncoder.encode(INFOLOG_EVENT));
        return infoLogEventFlowable(filter);
    }

    public List<AddressSetLogEventResponse> getAddressSetLogEvents(TransactionReceipt transactionReceipt) {
        List<Contract.EventValuesWithLog> valueList = extractEventParametersWithLog(ADDRESSSETLOG_EVENT, transactionReceipt);
        ArrayList<AddressSetLogEventResponse> responses = new ArrayList<AddressSetLogEventResponse>(valueList.size());
        for (Contract.EventValuesWithLog eventValues : valueList) {
            AddressSetLogEventResponse typedResponse = new AddressSetLogEventResponse();
            typedResponse.log = eventValues.getLog();
            typedResponse._to = (String) eventValues.getNonIndexedValues().get(0).getValue();
            typedResponse.to = (String) eventValues.getNonIndexedValues().get(1).getValue();
            responses.add(typedResponse);
        }
        return responses;
    }

    public Flowable<AddressSetLogEventResponse> addressSetLogEventFlowable(EthFilter filter) {
        return web3j.ethLogFlowable(filter).map(new io.reactivex.functions.Function<Log, AddressSetLogEventResponse>() {
            @Override
            public AddressSetLogEventResponse apply(Log log) {
                Contract.EventValuesWithLog eventValues = extractEventParametersWithLog(ADDRESSSETLOG_EVENT, log);
                AddressSetLogEventResponse typedResponse = new AddressSetLogEventResponse();
                typedResponse.log = log;
                typedResponse._to = (String) eventValues.getNonIndexedValues().get(0).getValue();
                typedResponse.to = (String) eventValues.getNonIndexedValues().get(1).getValue();
                return typedResponse;
            }
        });
    }

    public Flowable<AddressSetLogEventResponse> addressSetLogEventFlowable(DefaultBlockParameter startBlock, DefaultBlockParameter endBlock) {
        EthFilter filter = new EthFilter(startBlock, endBlock, getContractAddress());
        filter.addSingleTopic(EventEncoder.encode(ADDRESSSETLOG_EVENT));
        return addressSetLogEventFlowable(filter);
    }

    public List<ValueTransferLogEventResponse> getValueTransferLogEvents(TransactionReceipt transactionReceipt) {
        List<Contract.EventValuesWithLog> valueList = extractEventParametersWithLog(VALUETRANSFERLOG_EVENT, transactionReceipt);
        ArrayList<ValueTransferLogEventResponse> responses = new ArrayList<ValueTransferLogEventResponse>(valueList.size());
        for (Contract.EventValuesWithLog eventValues : valueList) {
            ValueTransferLogEventResponse typedResponse = new ValueTransferLogEventResponse();
            typedResponse.log = eventValues.getLog();
            typedResponse._sender = (String) eventValues.getNonIndexedValues().get(0).getValue();
            typedResponse._to = (String) eventValues.getNonIndexedValues().get(1).getValue();
            typedResponse._amount = (BigInteger) eventValues.getNonIndexedValues().get(2).getValue();
            responses.add(typedResponse);
        }
        return responses;
    }

    public Flowable<ValueTransferLogEventResponse> valueTransferLogEventFlowable(EthFilter filter) {
        return web3j.ethLogFlowable(filter).map(new io.reactivex.functions.Function<Log, ValueTransferLogEventResponse>() {
            @Override
            public ValueTransferLogEventResponse apply(Log log) {
                Contract.EventValuesWithLog eventValues = extractEventParametersWithLog(VALUETRANSFERLOG_EVENT, log);
                ValueTransferLogEventResponse typedResponse = new ValueTransferLogEventResponse();
                typedResponse.log = log;
                typedResponse._sender = (String) eventValues.getNonIndexedValues().get(0).getValue();
                typedResponse._to = (String) eventValues.getNonIndexedValues().get(1).getValue();
                typedResponse._amount = (BigInteger) eventValues.getNonIndexedValues().get(2).getValue();
                return typedResponse;
            }
        });
    }

    public Flowable<ValueTransferLogEventResponse> valueTransferLogEventFlowable(DefaultBlockParameter startBlock, DefaultBlockParameter endBlock) {
        EthFilter filter = new EthFilter(startBlock, endBlock, getContractAddress());
        filter.addSingleTopic(EventEncoder.encode(VALUETRANSFERLOG_EVENT));
        return valueTransferLogEventFlowable(filter);
    }

    @Deprecated
    public static Basic load(String contractAddress, Web3j web3j, Credentials credentials, BigInteger gasPrice, BigInteger gasLimit) {
        return new Basic(contractAddress, web3j, credentials, gasPrice, gasLimit);
    }

    @Deprecated
    public static Basic load(String contractAddress, Web3j web3j, TransactionManager transactionManager, BigInteger gasPrice, BigInteger gasLimit) {
        return new Basic(contractAddress, web3j, transactionManager, gasPrice, gasLimit);
    }

    public static Basic load(String contractAddress, Web3j web3j, Credentials credentials, ContractGasProvider contractGasProvider) {
        return new Basic(contractAddress, web3j, credentials, contractGasProvider);
    }

    public static Basic load(String contractAddress, Web3j web3j, TransactionManager transactionManager, ContractGasProvider contractGasProvider) {
        return new Basic(contractAddress, web3j, transactionManager, contractGasProvider);
    }

    public static RemoteCall<Basic> deploy(Web3j web3j, Credentials credentials, ContractGasProvider contractGasProvider, BigInteger initialWeiValue) {
        return deployRemoteCall(Basic.class, web3j, credentials, contractGasProvider, BINARY, "", initialWeiValue);
    }

    public static RemoteCall<Basic> deploy(Web3j web3j, TransactionManager transactionManager, ContractGasProvider contractGasProvider, BigInteger initialWeiValue) {
        return deployRemoteCall(Basic.class, web3j, transactionManager, contractGasProvider, BINARY, "", initialWeiValue);
    }

    @Deprecated
    public static RemoteCall<Basic> deploy(Web3j web3j, Credentials credentials, BigInteger gasPrice, BigInteger gasLimit, BigInteger initialWeiValue) {
        return deployRemoteCall(Basic.class, web3j, credentials, gasPrice, gasLimit, BINARY, "", initialWeiValue);
    }

    @Deprecated
    public static RemoteCall<Basic> deploy(Web3j web3j, TransactionManager transactionManager, BigInteger gasPrice, BigInteger gasLimit, BigInteger initialWeiValue) {
        return deployRemoteCall(Basic.class, web3j, transactionManager, gasPrice, gasLimit, BINARY, "", initialWeiValue);
    }

    public static class InfoLogEventResponse {
        public Log log;

        public byte[] _data;

        public String _sender;

        public BigInteger _value;

        public BigInteger _gas;
    }

    public static class AddressSetLogEventResponse {
        public Log log;

        public String _to;

        public String to;
    }

    public static class ValueTransferLogEventResponse {
        public Log log;

        public String _sender;

        public String _to;

        public BigInteger _amount;
    }
}
