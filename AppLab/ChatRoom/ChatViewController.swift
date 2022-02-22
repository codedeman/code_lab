//
//  ChatViewController.swift
//  AppLab
//
//  Created Pham Kien on 22.02.22.
//  Copyright © 2022 ___ORGANIZATIONNAME___. All rights reserved.
//
//

import UIKit
import MessageKit

// MARK: Presenter Interface
protocol ChatPresentationLogic: AnyObject {
    
}

// MARK: View
class ChatViewController: MessagesViewController {
    
    var interactor: ChatInteractorLogic!
    var router: ChatRoutingLogic!
    let sender = Sender(senderId: "any_unique_id", displayName: "Steven", photoURl: "")

    private  var messages = [Message]()
    
    // MARK: IBOutlet
    
    // MARK: View lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        fetchDataOnLoad()
        
    }
    
    // MARK: Fetch Chat
    private func fetchDataOnLoad() {
        // NOTE: Ask the Interactor to do some work
        
    }
    
    // MARK: SetupUI
    private func setupView() {
        
        messagesCollectionView.delegate = self
        messagesCollectionView.dataSource = self
        messagesCollectionView.messagesDisplayDelegate = self
    }
    
    // MARK: IBAction
}

// MARK: Connect View, Interactor, and Presenter
extension ChatViewController: ChatPresentationLogic {
    
}

extension ChatViewController:MessagesDataSource,MessagesLayoutDelegate,MessagesDisplayDelegate {
    func currentSender() -> SenderType {
        return sender
    }
    
    func messageForItem(at indexPath: IndexPath, in messagesCollectionView: MessagesCollectionView) -> MessageType {
        return messages[indexPath.section]
    }
    
    func numberOfSections(in messagesCollectionView: MessagesCollectionView) -> Int {
        return messages.count
    }
    
    
    
}
