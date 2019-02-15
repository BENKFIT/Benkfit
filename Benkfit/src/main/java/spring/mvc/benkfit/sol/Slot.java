package spring.mvc.benkfit.sol;

import io.reactivex.Flowable;
import java.math.BigInteger;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collections;
import java.util.List;
import java.util.concurrent.Callable;
import org.web3j.abi.EventEncoder;
import org.web3j.abi.TypeReference;
import org.web3j.abi.datatypes.Bool;
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
import org.web3j.tuples.generated.Tuple5;
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
public class Slot extends Contract {
    private static final String BINARY = "608060405260008054600160a060020a031916331790556105d6806100256000396000f3fe60806040526004361061008d576000357c0100000000000000000000000000000000000000000000000000000000900480633218b99d1161006b5780633218b99d146100d85780633ccfd60b146100e057806341c0e1b5146100f5578063db5549d21461010a5761008d565b806306661abd14610092578063066c415b146100a95780632ddbd13a146100b1575b600080fd5b34801561009e57600080fd5b506100a7610161565b005b6100a76101a2565b3480156100bd57600080fd5b506100c6610206565b60408051918252519081900360200190f35b6100a7610222565b3480156100ec57600080fd5b506100c66104d7565b34801561010157600080fd5b506100a7610545565b34801561011657600080fd5b506101346004803603602081101561012d57600080fd5b5035610548565b60408051958652602086019490945284840192909252606084015215156080830152519081900360a00190f35b60068054600181019091556040805182815290517f833764e3c287f1f028efa2c7ab34c307cc6b06cf4e0c8cc3de79c7a32c87b6539181900360200190a150565b600034116101af57600080fd5b600080526007602090815260008051602061058b833981519152805434019081905560408051918252517f6faec04115051da5f1e70354751c2cf4c8591106dde303fb3d6a0e0daa3029c2929181900390910190a1565b60008052600760205260008051602061058b8339815191525490565b6000341161022f57600080fd5b600080526007602090815260008051602061058b833981519152805434019081905560408051918252517f6faec04115051da5f1e70354751c2cf4c8591106dde303fb3d6a0e0daa3029c2929181900390910190a160646103e84360001901400681810460015590600a90820604600255600a810660035560025460015414156102cc57600434810290556005805460ff1916600117905561035a565b60035460015414156102f157600434810290556005805460ff1916600117905561035a565b600354600254141561031657600434810290556005805460ff1916600117905561035a565b60025460015414801561032c5750600354600254145b1561034a57600a34026004556005805460ff1916600117905561035a565b60006004556005805460ff191690555b6005546004546001546002546003546040805160ff9096161515865260208601949094528484019290925260608401526080830152517ff4e20228793c93a9885fef118421c5c7a671269893076350a127d2c5e90a9d249181900360a00190a1506040805160a08101825260018054825260025460208301908152600354938301938452600454606084019081526005805460ff1615156080860190815260088054958601815560005294517ff3f7a9fe364faab93b216da50a3214154f22a0a2b415b23a84c8169e8b636ee3949091029384015590517ff3f7a9fe364faab93b216da50a3214154f22a0a2b415b23a84c8169e8b636ee483015592517ff3f7a9fe364faab93b216da50a3214154f22a0a2b415b23a84c8169e8b636ee582015591517ff3f7a9fe364faab93b216da50a3214154f22a0a2b415b23a84c8169e8b636ee6830155517ff3f7a9fe364faab93b216da50a3214154f22a0a2b415b23a84c8169e8b636ee7909101805460ff1916911515919091179055565b6004546000808052600760205260008051602061058b833981519152805483900390556040519091339181156108fc02919084818181858888f19350505050158015610527573d6000803e3d6000fd5b505060008052600760205260008051602061058b8339815191525490565b33ff5b600880548290811061055657fe5b6000918252602090912060059091020180546001820154600283015460038401546004909401549294509092909160ff168556fe6d5257204ebe7d88fd91ae87941cb2dd9d8062b64ae5a2bd2d28ec40b9fbf6dfa165627a7a723058201af451c2df6d02d65ae24a1f4f0fd1e813176c73673fd171d62ba6105577cf9c0029";

    public static final String FUNC_COUNT = "count";

    public static final String FUNC_OWNERINPUT = "ownerInput";

    public static final String FUNC_TOTAL = "total";

    public static final String FUNC_GAMESTART = "gameStart";

    public static final String FUNC_WITHDRAW = "withdraw";

    public static final String FUNC_KILL = "kill";

    public static final String FUNC_SENDRESULT = "sendResult";

    public static final Event COUNTLOG_EVENT = new Event("countLog", 
            Arrays.<TypeReference<?>>asList(new TypeReference<Uint256>() {}));
    ;

    public static final Event TOTALLOG_EVENT = new Event("totalLog", 
            Arrays.<TypeReference<?>>asList(new TypeReference<Uint256>() {}));
    ;

    public static final Event RESULTLOG_EVENT = new Event("resultLog", 
            Arrays.<TypeReference<?>>asList(new TypeReference<Bool>() {}, new TypeReference<Uint256>() {}, new TypeReference<Uint256>() {}, new TypeReference<Uint256>() {}, new TypeReference<Uint256>() {}));
    ;

    @Deprecated
    protected Slot(String contractAddress, Web3j web3j, Credentials credentials, BigInteger gasPrice, BigInteger gasLimit) {
        super(BINARY, contractAddress, web3j, credentials, gasPrice, gasLimit);
    }

    protected Slot(String contractAddress, Web3j web3j, Credentials credentials, ContractGasProvider contractGasProvider) {
        super(BINARY, contractAddress, web3j, credentials, contractGasProvider);
    }

    @Deprecated
    protected Slot(String contractAddress, Web3j web3j, TransactionManager transactionManager, BigInteger gasPrice, BigInteger gasLimit) {
        super(BINARY, contractAddress, web3j, transactionManager, gasPrice, gasLimit);
    }

    protected Slot(String contractAddress, Web3j web3j, TransactionManager transactionManager, ContractGasProvider contractGasProvider) {
        super(BINARY, contractAddress, web3j, transactionManager, contractGasProvider);
    }

    public RemoteCall<TransactionReceipt> count() {
        final Function function = new Function(
                FUNC_COUNT, 
                Arrays.<Type>asList(), 
                Collections.<TypeReference<?>>emptyList());
        return executeRemoteCallTransaction(function);
    }

    public RemoteCall<TransactionReceipt> ownerInput(BigInteger weiValue) {
        final Function function = new Function(
                FUNC_OWNERINPUT, 
                Arrays.<Type>asList(), 
                Collections.<TypeReference<?>>emptyList());
        return executeRemoteCallTransaction(function, weiValue);
    }

    public RemoteCall<BigInteger> total() {
        final Function function = new Function(FUNC_TOTAL, 
                Arrays.<Type>asList(), 
                Arrays.<TypeReference<?>>asList(new TypeReference<Uint256>() {}));
        return executeRemoteCallSingleValueReturn(function, BigInteger.class);
    }

    public RemoteCall<TransactionReceipt> gameStart(BigInteger weiValue) {
        final Function function = new Function(
                FUNC_GAMESTART, 
                Arrays.<Type>asList(), 
                Collections.<TypeReference<?>>emptyList());
        return executeRemoteCallTransaction(function, weiValue);
    }

    public RemoteCall<TransactionReceipt> withdraw() {
        final Function function = new Function(
                FUNC_WITHDRAW, 
                Arrays.<Type>asList(), 
                Collections.<TypeReference<?>>emptyList());
        return executeRemoteCallTransaction(function);
    }

    public RemoteCall<TransactionReceipt> kill() {
        final Function function = new Function(
                FUNC_KILL, 
                Arrays.<Type>asList(), 
                Collections.<TypeReference<?>>emptyList());
        return executeRemoteCallTransaction(function);
    }

    public RemoteCall<Tuple5<BigInteger, BigInteger, BigInteger, BigInteger, Boolean>> sendResult(BigInteger param0) {
        final Function function = new Function(FUNC_SENDRESULT, 
                Arrays.<Type>asList(new org.web3j.abi.datatypes.generated.Uint256(param0)), 
                Arrays.<TypeReference<?>>asList(new TypeReference<Uint256>() {}, new TypeReference<Uint256>() {}, new TypeReference<Uint256>() {}, new TypeReference<Uint256>() {}, new TypeReference<Bool>() {}));
        return new RemoteCall<Tuple5<BigInteger, BigInteger, BigInteger, BigInteger, Boolean>>(
                new Callable<Tuple5<BigInteger, BigInteger, BigInteger, BigInteger, Boolean>>() {
                    @Override
                    public Tuple5<BigInteger, BigInteger, BigInteger, BigInteger, Boolean> call() throws Exception {
                        List<Type> results = executeCallMultipleValueReturn(function);
                        return new Tuple5<BigInteger, BigInteger, BigInteger, BigInteger, Boolean>(
                                (BigInteger) results.get(0).getValue(), 
                                (BigInteger) results.get(1).getValue(), 
                                (BigInteger) results.get(2).getValue(), 
                                (BigInteger) results.get(3).getValue(), 
                                (Boolean) results.get(4).getValue());
                    }
                });
    }

    public List<CountLogEventResponse> getCountLogEvents(TransactionReceipt transactionReceipt) {
        List<Contract.EventValuesWithLog> valueList = extractEventParametersWithLog(COUNTLOG_EVENT, transactionReceipt);
        ArrayList<CountLogEventResponse> responses = new ArrayList<CountLogEventResponse>(valueList.size());
        for (Contract.EventValuesWithLog eventValues : valueList) {
            CountLogEventResponse typedResponse = new CountLogEventResponse();
            typedResponse.log = eventValues.getLog();
            typedResponse.count = (BigInteger) eventValues.getNonIndexedValues().get(0).getValue();
            responses.add(typedResponse);
        }
        return responses;
    }

    public Flowable<CountLogEventResponse> countLogEventFlowable(EthFilter filter) {
        return web3j.ethLogFlowable(filter).map(new io.reactivex.functions.Function<Log, CountLogEventResponse>() {
            @Override
            public CountLogEventResponse apply(Log log) {
                Contract.EventValuesWithLog eventValues = extractEventParametersWithLog(COUNTLOG_EVENT, log);
                CountLogEventResponse typedResponse = new CountLogEventResponse();
                typedResponse.log = log;
                typedResponse.count = (BigInteger) eventValues.getNonIndexedValues().get(0).getValue();
                return typedResponse;
            }
        });
    }

    public Flowable<CountLogEventResponse> countLogEventFlowable(DefaultBlockParameter startBlock, DefaultBlockParameter endBlock) {
        EthFilter filter = new EthFilter(startBlock, endBlock, getContractAddress());
        filter.addSingleTopic(EventEncoder.encode(COUNTLOG_EVENT));
        return countLogEventFlowable(filter);
    }

    public List<TotalLogEventResponse> getTotalLogEvents(TransactionReceipt transactionReceipt) {
        List<Contract.EventValuesWithLog> valueList = extractEventParametersWithLog(TOTALLOG_EVENT, transactionReceipt);
        ArrayList<TotalLogEventResponse> responses = new ArrayList<TotalLogEventResponse>(valueList.size());
        for (Contract.EventValuesWithLog eventValues : valueList) {
            TotalLogEventResponse typedResponse = new TotalLogEventResponse();
            typedResponse.log = eventValues.getLog();
            typedResponse.totalBalance = (BigInteger) eventValues.getNonIndexedValues().get(0).getValue();
            responses.add(typedResponse);
        }
        return responses;
    }

    public Flowable<TotalLogEventResponse> totalLogEventFlowable(EthFilter filter) {
        return web3j.ethLogFlowable(filter).map(new io.reactivex.functions.Function<Log, TotalLogEventResponse>() {
            @Override
            public TotalLogEventResponse apply(Log log) {
                Contract.EventValuesWithLog eventValues = extractEventParametersWithLog(TOTALLOG_EVENT, log);
                TotalLogEventResponse typedResponse = new TotalLogEventResponse();
                typedResponse.log = log;
                typedResponse.totalBalance = (BigInteger) eventValues.getNonIndexedValues().get(0).getValue();
                return typedResponse;
            }
        });
    }

    public Flowable<TotalLogEventResponse> totalLogEventFlowable(DefaultBlockParameter startBlock, DefaultBlockParameter endBlock) {
        EthFilter filter = new EthFilter(startBlock, endBlock, getContractAddress());
        filter.addSingleTopic(EventEncoder.encode(TOTALLOG_EVENT));
        return totalLogEventFlowable(filter);
    }

    public List<ResultLogEventResponse> getResultLogEvents(TransactionReceipt transactionReceipt) {
        List<Contract.EventValuesWithLog> valueList = extractEventParametersWithLog(RESULTLOG_EVENT, transactionReceipt);
        ArrayList<ResultLogEventResponse> responses = new ArrayList<ResultLogEventResponse>(valueList.size());
        for (Contract.EventValuesWithLog eventValues : valueList) {
            ResultLogEventResponse typedResponse = new ResultLogEventResponse();
            typedResponse.log = eventValues.getLog();
            typedResponse._result = (Boolean) eventValues.getNonIndexedValues().get(0).getValue();
            typedResponse._reword = (BigInteger) eventValues.getNonIndexedValues().get(1).getValue();
            typedResponse.n1 = (BigInteger) eventValues.getNonIndexedValues().get(2).getValue();
            typedResponse.n2 = (BigInteger) eventValues.getNonIndexedValues().get(3).getValue();
            typedResponse.n3 = (BigInteger) eventValues.getNonIndexedValues().get(4).getValue();
            responses.add(typedResponse);
        }
        return responses;
    }

    public Flowable<ResultLogEventResponse> resultLogEventFlowable(EthFilter filter) {
        return web3j.ethLogFlowable(filter).map(new io.reactivex.functions.Function<Log, ResultLogEventResponse>() {
            @Override
            public ResultLogEventResponse apply(Log log) {
                Contract.EventValuesWithLog eventValues = extractEventParametersWithLog(RESULTLOG_EVENT, log);
                ResultLogEventResponse typedResponse = new ResultLogEventResponse();
                typedResponse.log = log;
                typedResponse._result = (Boolean) eventValues.getNonIndexedValues().get(0).getValue();
                typedResponse._reword = (BigInteger) eventValues.getNonIndexedValues().get(1).getValue();
                typedResponse.n1 = (BigInteger) eventValues.getNonIndexedValues().get(2).getValue();
                typedResponse.n2 = (BigInteger) eventValues.getNonIndexedValues().get(3).getValue();
                typedResponse.n3 = (BigInteger) eventValues.getNonIndexedValues().get(4).getValue();
                return typedResponse;
            }
        });
    }

    public Flowable<ResultLogEventResponse> resultLogEventFlowable(DefaultBlockParameter startBlock, DefaultBlockParameter endBlock) {
        EthFilter filter = new EthFilter(startBlock, endBlock, getContractAddress());
        filter.addSingleTopic(EventEncoder.encode(RESULTLOG_EVENT));
        return resultLogEventFlowable(filter);
    }

    @Deprecated
    public static Slot load(String contractAddress, Web3j web3j, Credentials credentials, BigInteger gasPrice, BigInteger gasLimit) {
        return new Slot(contractAddress, web3j, credentials, gasPrice, gasLimit);
    }

    @Deprecated
    public static Slot load(String contractAddress, Web3j web3j, TransactionManager transactionManager, BigInteger gasPrice, BigInteger gasLimit) {
        return new Slot(contractAddress, web3j, transactionManager, gasPrice, gasLimit);
    }

    public static Slot load(String contractAddress, Web3j web3j, Credentials credentials, ContractGasProvider contractGasProvider) {
        return new Slot(contractAddress, web3j, credentials, contractGasProvider);
    }

    public static Slot load(String contractAddress, Web3j web3j, TransactionManager transactionManager, ContractGasProvider contractGasProvider) {
        return new Slot(contractAddress, web3j, transactionManager, contractGasProvider);
    }

    public static RemoteCall<Slot> deploy(Web3j web3j, Credentials credentials, ContractGasProvider contractGasProvider, BigInteger initialWeiValue) {
        return deployRemoteCall(Slot.class, web3j, credentials, contractGasProvider, BINARY, "", initialWeiValue);
    }

    public static RemoteCall<Slot> deploy(Web3j web3j, TransactionManager transactionManager, ContractGasProvider contractGasProvider, BigInteger initialWeiValue) {
        return deployRemoteCall(Slot.class, web3j, transactionManager, contractGasProvider, BINARY, "", initialWeiValue);
    }

    @Deprecated
    public static RemoteCall<Slot> deploy(Web3j web3j, Credentials credentials, BigInteger gasPrice, BigInteger gasLimit, BigInteger initialWeiValue) {
        return deployRemoteCall(Slot.class, web3j, credentials, gasPrice, gasLimit, BINARY, "", initialWeiValue);
    }

    @Deprecated
    public static RemoteCall<Slot> deploy(Web3j web3j, TransactionManager transactionManager, BigInteger gasPrice, BigInteger gasLimit, BigInteger initialWeiValue) {
        return deployRemoteCall(Slot.class, web3j, transactionManager, gasPrice, gasLimit, BINARY, "", initialWeiValue);
    }

    public static class CountLogEventResponse {
        public Log log;

        public BigInteger count;
    }

    public static class TotalLogEventResponse {
        public Log log;

        public BigInteger totalBalance;
    }

    public static class ResultLogEventResponse {
        public Log log;

        public Boolean _result;

        public BigInteger _reword;

        public BigInteger n1;

        public BigInteger n2;

        public BigInteger n3;
    }
}
