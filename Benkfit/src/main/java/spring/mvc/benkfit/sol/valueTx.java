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
public class valueTx extends Contract {
    private static final String BINARY = "608060405260008054600160a060020a031916331790556101dd806100256000396000f3fe60806040526004361061003a577c010000000000000000000000000000000000000000000000000000000060003504636e2dd2b9811461003f575b600080fd5b6100726004803603602081101561005557600080fd5b503573ffffffffffffffffffffffffffffffffffffffff16610086565b604080519115158252519081900360200190f35b6000805473ffffffffffffffffffffffffffffffffffffffff1633146100ab57600080fd5b60005473ffffffffffffffffffffffffffffffffffffffff838116911614156100d357600080fd5b600034116100e057600080fd5b6001805473ffffffffffffffffffffffffffffffffffffffff80851673ffffffffffffffffffffffffffffffffffffffff1990921691909117918290556040519116903480156108fc02916000818181858888f1935050505015801561014a573d6000803e3d6000fd5b506000546001546040805173ffffffffffffffffffffffffffffffffffffffff9384168152919092166020820152348183015290517fb0cde5f38a1361ad12675f2d74c499d1ca3957aeb63669ec2eff6f284c1ead9e9181900360600190a150600191905056fea165627a7a72305820c2b293fe4f4fe3197960ebff9f8f934861b5730a65b6894bf901b17e0e9bff690029";

    public static final String FUNC_VALUETRANSFER = "valueTransfer";

    public static final Event VALUETRANSFERLOG_EVENT = new Event("valueTransferLog", 
            Arrays.<TypeReference<?>>asList(new TypeReference<Address>() {}, new TypeReference<Address>() {}, new TypeReference<Uint256>() {}));
    ;

    @Deprecated
    protected valueTx(String contractAddress, Web3j web3j, Credentials credentials, BigInteger gasPrice, BigInteger gasLimit) {
        super(BINARY, contractAddress, web3j, credentials, gasPrice, gasLimit);
    }

    protected valueTx(String contractAddress, Web3j web3j, Credentials credentials, ContractGasProvider contractGasProvider) {
        super(BINARY, contractAddress, web3j, credentials, contractGasProvider);
    }

    @Deprecated
    protected valueTx(String contractAddress, Web3j web3j, TransactionManager transactionManager, BigInteger gasPrice, BigInteger gasLimit) {
        super(BINARY, contractAddress, web3j, transactionManager, gasPrice, gasLimit);
    }

    protected valueTx(String contractAddress, Web3j web3j, TransactionManager transactionManager, ContractGasProvider contractGasProvider) {
        super(BINARY, contractAddress, web3j, transactionManager, contractGasProvider);
    }

    public RemoteCall<TransactionReceipt> valueTransfer(String _to, BigInteger weiValue) {
        final Function function = new Function(
                FUNC_VALUETRANSFER, 
                Arrays.<Type>asList(new org.web3j.abi.datatypes.Address(_to)), 
                Collections.<TypeReference<?>>emptyList());
        return executeRemoteCallTransaction(function, weiValue);
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
    public static valueTx load(String contractAddress, Web3j web3j, Credentials credentials, BigInteger gasPrice, BigInteger gasLimit) {
        return new valueTx(contractAddress, web3j, credentials, gasPrice, gasLimit);
    }

    @Deprecated
    public static valueTx load(String contractAddress, Web3j web3j, TransactionManager transactionManager, BigInteger gasPrice, BigInteger gasLimit) {
        return new valueTx(contractAddress, web3j, transactionManager, gasPrice, gasLimit);
    }

    public static valueTx load(String contractAddress, Web3j web3j, Credentials credentials, ContractGasProvider contractGasProvider) {
        return new valueTx(contractAddress, web3j, credentials, contractGasProvider);
    }

    public static valueTx load(String contractAddress, Web3j web3j, TransactionManager transactionManager, ContractGasProvider contractGasProvider) {
        return new valueTx(contractAddress, web3j, transactionManager, contractGasProvider);
    }

    public static RemoteCall<valueTx> deploy(Web3j web3j, Credentials credentials, ContractGasProvider contractGasProvider, BigInteger initialWeiValue) {
        return deployRemoteCall(valueTx.class, web3j, credentials, contractGasProvider, BINARY, "", initialWeiValue);
    }

    public static RemoteCall<valueTx> deploy(Web3j web3j, TransactionManager transactionManager, ContractGasProvider contractGasProvider, BigInteger initialWeiValue) {
        return deployRemoteCall(valueTx.class, web3j, transactionManager, contractGasProvider, BINARY, "", initialWeiValue);
    }

    @Deprecated
    public static RemoteCall<valueTx> deploy(Web3j web3j, Credentials credentials, BigInteger gasPrice, BigInteger gasLimit, BigInteger initialWeiValue) {
        return deployRemoteCall(valueTx.class, web3j, credentials, gasPrice, gasLimit, BINARY, "", initialWeiValue);
    }

    @Deprecated
    public static RemoteCall<valueTx> deploy(Web3j web3j, TransactionManager transactionManager, BigInteger gasPrice, BigInteger gasLimit, BigInteger initialWeiValue) {
        return deployRemoteCall(valueTx.class, web3j, transactionManager, gasPrice, gasLimit, BINARY, "", initialWeiValue);
    }

    public static class ValueTransferLogEventResponse {
        public Log log;

        public String _sender;

        public String _to;

        public BigInteger _amount;
    }
}
