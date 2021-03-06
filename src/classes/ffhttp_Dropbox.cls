/**
 * Copyright (c) 2014, FinancialForce.com, inc
 * All rights reserved.
 *
 * Redistribution and use in source and binary forms, with or without modification, 
 *   are permitted provided that the following conditions are met:
 *
 * - Redistributions of source code must retain the above copyright notice, 
 *      this list of conditions and the following disclaimer.
 * - Redistributions in binary form must reproduce the above copyright notice, 
 *      this list of conditions and the following disclaimer in the documentation 
 *      and/or other materials provided with the distribution.
 * - Neither the name of the FinancialForce.com, inc nor the names of its contributors 
 *      may be used to endorse or promote products derived from this software without 
 *      specific prior written permission.
 *
 * THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND 
 *  ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES 
 *  OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL 
 *  THE COPYRIGHT HOLDER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, 
 *  EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS
 *  OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY
 *  OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE)
 *  ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
**/

/**
 * ffhttp_Dropbox
 *
 * The main Dropbox client class.
 * This class contains the methods to access each of the Dropbox API calls.
 */
public with sharing class ffhttp_Dropbox extends ffhttp_Client.AbstractClient 
{	
	/**
	 * Constructor.
	 *
     * @param credentials HTTP request credentials required for authentication.
     * @return The Dropbox API HTTP client giving access to all API calls.
     */
	public ffhttp_Dropbox(ffhttp_Client.Credentials credentials) 
	{ 
		//Shouldn't need this but in the case of the Dropbox API the access token request returns the token type as
    	//'bearer', if this is then sent in a request a 'Bad Request' is returned. Therefore get the token type and 
    	//capitalize it.
		String tokenType = credentials.getTokenType();
	    tokenType = tokenType.capitalize();
	    credentials.setTokenType(tokenType);
	        	
		this.setCredentials(credentials);
	}
	
	/**
	 * An accessor for creating requests for the Account collection
	 *
	 * @return The resources collection.
	 */
	public ffhttp_DropboxAccounts accounts()
	{
		return new ffhttp_DropboxAccounts(this);
	}
	
	/**
	 * An accessor for creating requests from the Files collection.
	 *
	 * @return The resources collection.
	 */
	public ffhttp_DropboxFiles files()
	{
		return new ffhttp_DropboxFiles(this);
	}
	
	/**
	 * An accessor for creating requests from the FileOperations collection.
	 *
	 * @return The resources collection.
	 */
	public ffhttp_DropboxFileOperations fileOperations()
	{
		return new ffhttp_DropboxFileOperations(this);
	}
}
