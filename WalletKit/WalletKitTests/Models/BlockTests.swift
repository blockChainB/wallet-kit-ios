import XCTest
import Cuckoo
import HSCryptoKit
@testable import WalletKit

class BlockTests: XCTestCase {

    func testCreateWithPreviousBlock() {
        let previousBlock = Block()
        previousBlock.height = 1

        let header: BlockHeader = TestData.checkpointBlock.header!
        let headerHash = CryptoKit.sha256sha256(BlockHeaderSerializer.serialize(header: header))

        let block = Block(withHeader: header, previousBlock: previousBlock)

        XCTAssertEqual(block.header, header)
        XCTAssertEqual(block.previousBlock, previousBlock)
        XCTAssertEqual(block.height, 2)
        XCTAssertEqual(block.headerHash, headerHash)
        XCTAssertEqual(block.reversedHeaderHashHex, headerHash.reversedHex)
    }

    func testCreateWithHeight() {
        let height = 1

        let header: BlockHeader = TestData.checkpointBlock.header!
        let headerHash = CryptoKit.sha256sha256(BlockHeaderSerializer.serialize(header: header))

        let block = Block(withHeader: header, height: height)

        XCTAssertEqual(block.header, header)
        XCTAssertEqual(block.previousBlock, nil)
        XCTAssertEqual(block.height, height)
        XCTAssertEqual(block.headerHash, headerHash)
        XCTAssertEqual(block.reversedHeaderHashHex, headerHash.reversedHex)
    }

}
