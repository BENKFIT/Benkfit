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
import org.web3j.abi.datatypes.Address;
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
import org.web3j.tuples.generated.Tuple6;
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
    private static final String BINARY = "608060405260008054600160a060020a0319163317905561043a806100256000396000f3fe608060405260043610610050577c0100000000000000000000000000000000000000000000000000000000600035046311610c258114610055578063117a5b901461005f57806341c0e1b5146100d3575b600080fd5b61005d6100e8565b005b34801561006b57600080fd5b506100896004803603602081101561008257600080fd5b5035610374565b6040805173ffffffffffffffffffffffffffffffffffffffff90971687529415156020870152858501939093526060850191909152608084015260a0830152519081900360c00190f35b3480156100df57600080fd5b5061005d6103e7565b6000546040340273ffffffffffffffffffffffffffffffffffffffff90911631101561011357600080fd5b60006103e860001943014006606480820490600a908306819004908306348284141561014157600195506004025b8183141561015157600195506004025b8184141561016157600195506004025b851561019a57604051339082156108fc029083906000818181858888f19350505050158015610194573d6000803e3d6000fd5b5061019e565b5060005b604080513381528715156020820152808201839052606081018690526080810185905260a0810184905290517f755e2e5141a35c052c4551b97ea95e478fa0a8ca14280e4067af9f6d880b78449181900360c00190a16040805160c081018252338152961515602088019081523491880191825260608801968752608088019283524360a0890190815260028054600181018255600091909152985160059099027f405787fa12a823e0f2b7631cc41b3ba8828b3321ca811111fa75cd3aa3bb5ace8101805493511515740100000000000000000000000000000000000000000274ff00000000000000000000000000000000000000001973ffffffffffffffffffffffffffffffffffffffff9c909c1673ffffffffffffffffffffffffffffffffffffffff19909516949094179a909a169290921790985590517f405787fa12a823e0f2b7631cc41b3ba8828b3321ca811111fa75cd3aa3bb5acf82015594517f405787fa12a823e0f2b7631cc41b3ba8828b3321ca811111fa75cd3aa3bb5ad0860155517f405787fa12a823e0f2b7631cc41b3ba8828b3321ca811111fa75cd3aa3bb5ad1850155505091517f405787fa12a823e0f2b7631cc41b3ba8828b3321ca811111fa75cd3aa3bb5ad29091015550565b600280548290811061038257fe5b60009182526020909120600590910201805460018201546002830154600384015460049094015473ffffffffffffffffffffffffffffffffffffffff841695507401000000000000000000000000000000000000000090930460ff1693919290919086565b60005473ffffffffffffffffffffffffffffffffffffffff16331461040b57600080fd5b33fffea165627a7a723058201756950c55d087c05d01c57dd62d01e393af5c59a9f889b82bb042213fcdd7bd0029";

    public static final String FUNC_BET = "bet";

    public static final String FUNC_GAMES = "games";

    public static final String FUNC_KILL = "kill";

    public static final Event SENDRESULT_EVENT = new Event("sendResult", 
            Arrays.<TypeReference<?>>asList(new TypeReference<Address>() {}, new TypeReference<Bool>() {}, new TypeReference<Uint256>() {}, new TypeReference<Uint256>() {}, new TypeReference<Uint256>() {}, new TypeReference<Uint256>() {}));
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

    public RemoteCall<TransactionReceipt> bet(BigInteger weiValue) {
        final Function function = new Function(
                FUNC_BET, 
                Arrays.<Type>asList(), 
                Collections.<TypeReference<?>>emptyList());
        return executeRemoteCallTransaction(function, weiValue);
    }

    public RemoteCall<Tuple6<String, Boolean, BigInteger, BigInteger, BigInteger, BigInteger>> games(BigInteger param0) {
        final Function function = new Function(FUNC_GAMES, 
                Arrays.<Type>asList(new org.web3j.abi.datatypes.generated.Uint256(param0)), 
                Arrays.<TypeReference<?>>asList(new TypeReference<Address>() {}, new TypeReference<Bool>() {}, new TypeReference<Uint256>() {}, new TypeReference<Uint256>() {}, new TypeReference<Uint256>() {}, new TypeReference<Uint256>() {}));
        return new RemoteCall<Tuple6<String, Boolean, BigInteger, BigInteger, BigInteger, BigInteger>>(
                new Callable<Tuple6<String, Boolean, BigInteger, BigInteger, BigInteger, BigInteger>>() {
                    @Override
                    public Tuple6<String, Boolean, BigInteger, BigInteger, BigInteger, BigInteger> call() throws Exception {
                        List<Type> results = executeCallMultipleValueReturn(function);
                        return new Tuple6<String, Boolean, BigInteger, BigInteger, BigInteger, BigInteger>(
                                (String) results.get(0).getValue(), 
                                (Boolean) results.get(1).getValue(), 
         
                                (BigInteger) results.get(2).getValue(), 
                                (BigInteger) results.get(3).getValue(), 
                                (BigInteger) results.get(4).getValue(), 
                                (BigInteger) results.get(5).getValue());
                    }
                });
    }

    public RemoteCall<TransactionReceipt> kill() {
        final Function function = new Function(
                FUNC_KILL, 
                Arrays.<Type>asList(), 
                Collections.<TypeReference<?>>emptyList());
        return executeRemoteCallTransaction(function);
    }

    public List<SendResultEventResponse> getSendResultEvents(TransactionReceipt transactionReceipt) {
        List<Contract.EventValuesWithLog> valueList = extractEventParametersWithLog(SENDRESULT_EVENT, transactionReceipt);
        ArrayList<SendResultEventResponse> responses = new ArrayList<SendResultEventResponse>(valueList.size());
        for (Contract.EventValuesWithLog eventValues : valueList) {
            SendResultEventResponse typedResponse = new SendResultEventResponse();
            typedResponse.log = eventValues.getLog();
            typedResponse.player = (String) eventValues.getNonIndexedValues().get(0).getValue();
            typedResponse.win = (Boolean) eventValues.getNonIndexedValues().get(1).getValue();
            typedResponse.amount = (BigInteger) eventValues.getNonIndexedValues().get(2).getValue();
            typedResponse.n1 = (BigInteger) eventValues.getNonIndexedValues().get(3).getValue();
            typedResponse.n2 = (BigInteger) eventValues.getNonIndexedValues().get(4).getValue();
            typedResponse.n3 = (BigInteger) eventValues.getNonIndexedValues().get(5).getValue();
            responses.add(typedResponse);
        }
        return responses;
    }

    public Flowable<SendResultEventResponse> sendResultEventFlowable(EthFilter filter) {
        return web3j.ethLogFlowable(filter).map(new io.reactivex.functions.Function<Log, SendResultEventResponse>() {
            @Override
            public SendResultEventResponse apply(Log log) {
                Contract.EventValuesWithLog eventValues = extractEventParametersWithLog(SENDRESULT_EVENT, log);
                SendResultEventResponse typedResponse = new SendResultEventResponse();
                typedResponse.log = log;
                typedResponse.player = (String) eventValues.getNonIndexedValues().get(0).getValue();
                typedResponse.win = (Boolean) eventValues.getNonIndexedValues().get(1).getValue();
                typedResponse.amount = (BigInteger) eventValues.getNonIndexedValues().get(2).getValue();
                typedResponse.n1 = (BigInteger) eventValues.getNonIndexedValues().get(3).getValue();
                typedResponse.n2 = (BigInteger) eventValues.getNonIndexedValues().get(4).getValue();
                typedResponse.n3 = (BigInteger) eventValues.getNonIndexedValues().get(5).getValue();
                return typedResponse;
            }
        });
    }

    public Flowable<SendResultEventResponse> sendResultEventFlowable(DefaultBlockParameter startBlock, DefaultBlockParameter endBlock) {
        EthFilter filter = new EthFilter(startBlock, endBlock, getContractAddress());
        filter.addSingleTopic(EventEncoder.encode(SENDRESULT_EVENT));
        return sendResultEventFlowable(filter);
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

    public static class SendResultEventResponse {
        public Log log;

        public String player;

        public Boolean win;

        public BigInteger amount;

        public BigInteger n1;

        public BigInteger n2;

        public BigInteger n3;
    }
}
