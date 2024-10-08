#if defined _INC_omp_database
	#endinput
#endif
#define _INC_omp_database

/**
 * <library name="omp_database" summary="open.mp SQLite functions.">
 *   <license>
 *     This Source Code Form is subject to the terms of the Mozilla Public License,
 *     v. 2.0. If a copy of the MPL was not distributed with this file, You can
 *     obtain one at http://mozilla.org/MPL/2.0/.
 *    
 *     The original code is copyright (c) 2023, open.mp team and contributors.
 *   </license>
 *   <summary pawndoc="true">
 *     This library uses the enhanced <em>pawndoc.xsl</em> from
 *     <a href="https://github.com/pawn-lang/pawndoc">pawn-lang/pawndoc</a>.
 *     This XSL has features such as library and markdown support, and will not
 *     render this message when used.
 *   </summary>
 * </library>
 */

/// <p/>

#pragma tabsize 4

/// <p/>
/**
 * <library>omp_database</library>
 */
enum SQLITE_OPEN:__SQLITE_OPEN
{
	UNKNOWN_SQLITE_OPEN                        = -1,
	SQLITE_OPEN_READONLY                       = 0x00000001,
	SQLITE_OPEN_READWRITE                      = 0x00000002,
	SQLITE_OPEN_CREATE                         = 0x00000004,
	SQLITE_OPEN_DELETEONCLOSE                  = 0x00000008, // Requires VFS.
	SQLITE_OPEN_EXCLUSIVE                      = 0x00000010, // Requires VFS.
	SQLITE_OPEN_AUTOPROXY                      = 0x00000020, // Requires VFS.
	SQLITE_OPEN_URI                            = 0x00000040,
	SQLITE_OPEN_MEMORY                         = 0x00000080,
	SQLITE_OPEN_MAIN_DB                        = 0x00000100, // Requires VFS.
	SQLITE_OPEN_TEMP_DB                        = 0x00000200, // Requires VFS.
	SQLITE_OPEN_TRANSIENT_DB                   = 0x00000400, // Requires VFS.
	SQLITE_OPEN_MAIN_JOURNAL                   = 0x00000800, // Requires VFS.
	SQLITE_OPEN_TEMP_JOURNAL                   = 0x00001000, // Requires VFS.
	SQLITE_OPEN_SUBJOURNAL                     = 0x00002000, // Requires VFS.
	SQLITE_OPEN_SUPER_JOURNAL                  = 0x00004000, // Requires VFS.
	SQLITE_OPEN_NOMUTEX                        = 0x00008000,
	SQLITE_OPEN_FULLMUTEX                      = 0x00010000,
	SQLITE_OPEN_SHAREDCACHE                    = 0x00020000,
	SQLITE_OPEN_PRIVATECACHE                   = 0x00040000,
	SQLITE_OPEN_WAL                            = 0x00080000, // Requires VFS.
	SQLITE_OPEN_NOFOLLOW                       = 0x01000000,
	SQLITE_OPEN_EXRESCODE                      = 0x02000000
}
static stock SQLITE_OPEN:_@SQLITE_OPEN() { return __SQLITE_OPEN; }

/*
                                                                                                                        
    88b           d88                        88                                                 db         88888888ba   88  
    888b         d888                        88                                                d88b        88      "8b  88  
    88`8b       d8'88                        88                                               d8'`8b       88      ,8P  88  
    88 `8b     d8' 88   ,adPPYba,    ,adPPYb,88   ,adPPYba,  8b,dPPYba,  8b,dPPYba,          d8'  `8b      88aaaaaa8P'  88  
    88  `8b   d8'  88  a8"     "8a  a8"    `Y88  a8P_____88  88P'   "Y8  88P'   `"8a        d8YaaaaY8b     88""""""'    88  
    88   `8b d8'   88  8b       d8  8b       88  8PP"""""""  88          88       88       d8""""""""8b    88           88  
    88    `888'    88  "8a,   ,a8"  "8a,   ,d88  "8b,   ,aa  88          88       88      d8'        `8b   88           88  
    88     `8'     88   `"YbbdP"'    `"8bbdP"Y8   `"Ybbd8"'  88          88       88     d8'          `8b  88           88  
                                                                                                                        
                                                                                                                        

*/

/*
native #Modern API();
*/

/**
 * <library>omp_database</library>
 * <summary>This function is used to open a connection to a SQLite database, which is inside the <b><c>/scriptfiles</c></b>
 * folder.</summary>
 * <param name="name">File name of the database</param>
 * <remarks>
 *   It will create a new SQLite database, if there is no SQLite database with the same file name available.<br
 * />
 *   <b>Close</b> your database connection with <a href="#db_close">db_close</a>!
 * </remarks>
 * <returns>Returns index (starting at <b><c>1</c></b>) of the database connection .</returns>
 */
native DB:DB_Open(const name[], SQLITE_OPEN:flags = SQLITE_OPEN_READWRITE | SQLITE_OPEN_CREATE);

/**
 * <library>omp_database</library>
 * <summary>Closes an SQLite database that was opened with <a href="#db_open">db_open</a>.</summary>
 * <param name="db">The handle of the database connection to close (returned by <a href="#db_open">db_open</a>)</param>
 * <remarks>Using an <b>invalid handle</b> will crash your server! Get a <b>valid handle</b> by using
 * <a href="#db_open">db_open</a>.  But it's protected against <b><c>NULL</c></b> references</remarks>
 * <returns>
 *   <b><c>1</c></b>: The function executed successfully.<br />
 *   <b><c>0</c></b>: The function failed to execute.  May mean that the database handle specified is
 * not open.
 * </returns>
 */
native bool:DB_Close(DB:db);

/**
 * <library>omp_database</library>
 * <summary>This function is used to execute an SQL query on an opened SQLite database.</summary>
 * <param name="db">The database handle to query</param>
 * <param name="query">The query to execute.  May be optionally formatted.</param>
 * <remarks><b>Always</b> free the result by using <a href="#db_free_result">db_free_result</a>!</remarks>
 * <returns>The query result index (<b>starting at 1</b>).</returns>
 */
native DBResult:DB_ExecuteQuery(DB:db, const query[], OPEN_MP_TAGS:...);

/**
 * <library>omp_database</library>
 * <summary>Frees result memory allocated from <a href="#db_query">db_query</a>.</summary>
 * <param name="result">The result to free</param>
 * <returns>If <b><c>DBResult:dbhandle</c></b> is a valid handle, it returns <b><c>1</c></b>, otherwise
 * <b><c>0</c></b> if <b><c>DBResult:dbhandle</c></b> is a <b><c>NULL</c></b> reference.</returns>
 */
native bool:DB_FreeResultSet(DBResult:result);

/**
 * <library>omp_database</library>
 * <summary>Returns the number of rows from a <a href="#db_query">db_query</a>.</summary>
 * <param name="result">The result of <a href="#db_query">db_query</a></param>
 * <remarks>Using an <b>invalid handle</b> will crash your server! Get a <b>valid handle</b> by using
 * <a href="#db_open">db_open</a>.  But it's protected against <b><c>NULL</c></b> references</remarks>
 * <returns>The number of rows in the result.</returns>
 */
native DB_GetRowCount(DBResult:result);

/**
 * <library>omp_database</library>
 * <summary>Moves to the next row of the result allocated from <a href="#db_query">db_query</a>.</summary>
 * <param name="result">The result of <a href="#db_query">db_query</a></param>
 * <remarks>Using an <b>invalid handle</b> will crash your server! Get a <b>valid handle</b> by using
 * <a href="#db_open">db_open</a>.  But it's protected against <b><c>NULL</c></b> references</remarks>
 * <returns>Returns <b><c>1</c></b> on success, otherwise <b><c>0</c></b> if <b><c>DBResult:result</c></b>
 * is a <b><c>NULL</c></b> reference or the last row is reached.</returns>
 */
native bool:DB_SelectNextRow(DBResult:result);

/**
 * <library>omp_database</library>
 * <summary>Get the number of fields in a result.</summary>
 * <param name="result">The result of <a href="#db_query">db_query</a></param>
 * <remarks>Using an <b>invalid handle</b> will crash your server! Get a <b>valid handle</b> by using
 * <a href="#db_open">db_open</a>.  But it's protected against <b><c>NULL</c></b> references</remarks>
 * <returns>The number of fields in the result.</returns>
 */
native DB_GetFieldCount(DBResult:result);

/**
 * <library>omp_database</library>
 * <summary>Returns the name of a field at a particular index.</summary>
 * <param name="result">The result to get the data from; returned by <a href="#db_query">db_query</a></param>
 * <param name="field">The index of the field to get the name of</param>
 * <param name="output">The returned value</param>
 * <param name="size">The max length of the field</param>
 * <remarks>Using an <b>invalid handle</b> will crash your server! Get a <b>valid handle</b> by using
 * <a href="#db_open">db_open</a>.  But it's protected against <b><c>NULL</c></b> references</remarks>
 * <returns>Returns <b><c>1</c></b>, if the function was successful, otherwise <b><c>0</c></b> if <b><c>DBResult:result</c></b>
 * is a <b><c>NULL</c></b> reference or the column index not available.</returns>
 */
native bool:DB_GetFieldName(DBResult:result, field, output[], size = sizeof (output));

/**
 * <library>omp_database</library>
 * <summary>Get the content of a field from <a href="#db_query">db_query</a>.</summary>
 * <param name="result">The result to get the data from</param>
 * <param name="field">The field to get the data from</param>
 * <param name="output">The returned value</param>
 * <param name="size">The max length of the field</param>
 * <remarks>Using an <b>invalid handle</b> will crash your server! Get a <b>valid handle</b> by using
 * <a href="#db_open">db_open</a>.  But it's protected against <b><c>NULL</c></b> references</remarks>
 * <returns>Returns <b><c>1</c></b> if successful, otherwise <b><c>0</c></b> if <b><c>DBResult:result</c></b>
 * is a <b><c>NULL</c></b> reference or the column index not available.</returns>
 */
native bool:DB_GetFieldString(DBResult:result, field, output[], size = sizeof (output));

/**
 * <library>omp_database</library>
 * <summary>Get the content of a field as an integer from <a href="#db_query">db_query</a>.</summary>
 * <param name="result">The result to get the data from</param>
 * <param name="field">The field to get the data from (optional=<b><c>0</c></b>)</param>
 * <remarks>Using an <b>invalid handle</b> will crash your server! Get a <b>valid handle</b> by using
 * <a href="#db_open">db_open</a>.  But it's protected against <b><c>NULL</c></b> references</remarks>
 * <returns>Retrieved value as integer (number).</returns>
 */
native DB_GetFieldInt(DBResult:result, field = 0);

/**
 * <library>omp_database</library>
 * <summary>Get the content of a field as a float from db_query.</summary>
 * <param name="result">The result to get the data from</param>
 * <param name="field">The field to get the data from (optional=<b><c>0</c></b>)</param>
 * <remarks>Using an <b>invalid handle</b> will crash your server! Get a <b>valid handle</b> by using
 * <a href="#db_open">db_open</a>.  But it's protected against <b><c>NULL</c></b> references</remarks>
 * <returns>Retrieved value as floating point number.</returns>
 */
native Float:DB_GetFieldFloat(DBResult:result, field = 0);

/**
 * <library>omp_database</library>
 * <summary>Get the contents of field with specified name.</summary>
 * <param name="result">The result to get the data from</param>
 * <param name="field">The fieldname to get the data from</param>
 * <param name="output">The returned value</param>
 * <param name="size">The max length of the field</param>
 * <remarks>Using an <b>invalid handle</b> will crash your server! Get a <b>valid handle</b> by using
 * <a href="#db_open">db_open</a>.  But it's protected against <b><c>NULL</c></b> references</remarks>
 * <returns>Returns <b><c>1</c></b> if successful, otherwise <b><c>0</c></b> if <b><c>DBResult:result</c></b>
 * is a <b><c>NULL</c></b> reference or the column index not available.</returns>
 */
native bool:DB_GetFieldStringByName(DBResult:result, const field[], output[], size = sizeof (output));

/**
 * <library>omp_database</library>
 * <summary>Get the contents of field as an integer with specified name.</summary>
 * <param name="result">The result to get the data from</param>
 * <param name="field">The fieldname to get the data from</param>
 * <remarks>Using an <b>invalid handle</b> will crash your server! Get a <b>valid handle</b> by using
 * <a href="#db_open">db_open</a>.  But it's protected against <b><c>NULL</c></b> references</remarks>
 * <returns>Retrieved value as integer (number).</returns>
 */
native DB_GetFieldIntByName(DBResult:result, const field[]);

/**
 * <library>omp_database</library>
 * <summary>Get the contents of field as a float with specified name.</summary>
 * <param name="result">The result to get the data from</param>
 * <param name="field">The fieldname to get the data from</param>
 * <remarks>Using an <b>invalid handle</b> will crash your server! Get a <b>valid handle</b> by using
 * <a href="#db_open">db_open</a>.  But it's protected against <b><c>NULL</c></b> references</remarks>
 * <returns>Retrieved value as floating point number.</returns>
 */
native Float:DB_GetFieldFloatByName(DBResult:result, const field[]);

/**
 * <library>omp_database</library>
 * <summary>Get memory handle for an SQLite database that was opened with <a href="#db_open">db_open</a>.</summary>
 * <param name="db">The index of the database connection (returned by <a href="#db_open">db_open</a>)</param>
 * <returns>Returns the memory handle for a specified database.</returns>
 */
native DB_GetMemHandle(DB:db);

/**
 * <library>omp_database</library>
 * <summary>Get <b>memory handle</b> for an SQLite query that was executed with <a href="#db_query">db_query</a>.</summary>
 * <param name="result">The index of the query (returned by <a href="#db_query">db_query</a>)</param>
 * <returns>Returns the memory handle for a specified query.</returns>
 */
native DB_GetLegacyDBResult(DBResult:result);

/**
 * <library>omp_database</library>
 */
native DB_GetDatabaseConnectionCount();

/**
 * <library>omp_database</library>
 */
native DB_GetDatabaseResultSetCount();

/*
                                                                                                                             
    88888888ba,                                                                                                          88  
    88      `"8b                                                                              ,d                         88  
    88        `8b                                                                             88                         88  
    88         88   ,adPPYba,  8b,dPPYba,   8b,dPPYba,   ,adPPYba,   ,adPPYba,  ,adPPYYba,  MM88MMM  ,adPPYba,   ,adPPYb,88  
    88         88  a8P_____88  88P'    "8a  88P'   "Y8  a8P_____88  a8"     ""  ""     `Y8    88    a8P_____88  a8"    `Y88  
    88         8P  8PP"""""""  88       d8  88          8PP"""""""  8b          ,adPPPPP88    88    8PP"""""""  8b       88  
    88      .a8P   "8b,   ,aa  88b,   ,a8"  88          "8b,   ,aa  "8a,   ,aa  88,    ,88    88,   "8b,   ,aa  "8a,   ,d88  
    88888888Y"'     `"Ybbd8"'  88`YbbdP"'   88           `"Ybbd8"'   `"Ybbd8"'  `"8bbdP"Y8    "Y888  `"Ybbd8"'   `"8bbdP"Y8  
                               88                                                                                            
                               88                                                                                            

*/

/*
native #Deprecated Legacy();
*/

/**
 * <library>omp_database</library>
 */
#pragma deprecated Use `DB_Open`
native DB:db_open(const name[]) = DB_Open;

/**
 * <library>omp_database</library>
 */
#pragma deprecated Use `DB_Close`
native bool:db_close(DB:db) = DB_Close;

/**
 * <library>omp_database</library>
 */
#pragma deprecated Use `DB_ExecuteQuery`
native DBResult:db_query(DB:db, const query[]) = DB_ExecuteQuery;

/**
 * <library>omp_database</library>
 */
#pragma deprecated Use `DB_FreeResultSet`
native bool:db_free_result(DBResult:result) = DB_FreeResultSet;

/**
 * <library>omp_database</library>
 */
#pragma deprecated Use `DB_GetRowCount`
native db_num_rows(DBResult:result) = DB_GetRowCount;

/**
 * <library>omp_database</library>
 */
#pragma deprecated Use `DB_SelectNextRow`
native bool:db_next_row(DBResult:result) = DB_SelectNextRow;

/**
 * <library>omp_database</library>
 */
#pragma deprecated Use `DB_GetFieldCount`
native db_num_fields(DBResult:result) = DB_GetFieldCount;

/**
 * <library>omp_database</library>
 */
#pragma deprecated Use `DB_GetFieldName`
native bool:db_field_name(DBResult:result, field, output[], size = sizeof (output)) = DB_GetFieldName;

/**
 * <library>omp_database</library>
 */
#pragma deprecated Use `DB_GetFieldString`
native bool:db_get_field(DBResult:result, field, output[], size = sizeof (output)) = DB_GetFieldString;

/**
 * <library>omp_database</library>
 */
#pragma deprecated Use `DB_GetFieldInt`
native db_get_field_int(DBResult:result, field = 0) = DB_GetFieldInt;

/**
 * <library>omp_database</library>
 */
#pragma deprecated Use `DB_GetFieldFloat`
native Float:db_get_field_float(DBResult:result, field = 0) = DB_GetFieldFloat;

/**
 * <library>omp_database</library>
 */
#pragma deprecated Use `DB_GetFieldStringByName`
native bool:db_get_field_assoc(DBResult:result, const field[], output[], size = sizeof (output)) = DB_GetFieldStringByName;

/**
 * <library>omp_database</library>
 */
#pragma deprecated Use `DB_GetFieldIntByName`
native db_get_field_assoc_int(DBResult:result, const field[]) = DB_GetFieldIntByName;

/**
 * <library>omp_database</library>
 */
#pragma deprecated Use `DB_GetFieldFloatByName`
native Float:db_get_field_assoc_float(DBResult:result, const field[]) = DB_GetFieldFloatByName;

/**
 * <library>omp_database</library>
 */
#pragma deprecated Use `DB_GetMemHandle`
native db_get_mem_handle(DB:db) = DB_GetMemHandle;

/**
 * <library>omp_database</library>
 */
#pragma deprecated Use `DB_GetLegacyDBResult`
native db_get_result_mem_handle(DBResult:result) = DB_GetLegacyDBResult;

/**
 * <library>omp_database</library>
 */
#pragma deprecated Use `DB_GetDatabaseConnectionCount`
native db_debug_openfiles() = DB_GetDatabaseConnectionCount;

/**
 * <library>omp_database</library>
 */
#pragma deprecated Use `DB_GetDatabaseResultSetCount`
native db_debug_openresults() = DB_GetDatabaseResultSetCount;

/*
                                                                                                                             
    88888888ba,                                                                                                          88  
    88      `"8b                                                                              ,d                         88  
    88        `8b                                                                             88                         88  
    88         88   ,adPPYba,  8b,dPPYba,   8b,dPPYba,   ,adPPYba,   ,adPPYba,  ,adPPYYba,  MM88MMM  ,adPPYba,   ,adPPYb,88  
    88         88  a8P_____88  88P'    "8a  88P'   "Y8  a8P_____88  a8"     ""  ""     `Y8    88    a8P_____88  a8"    `Y88  
    88         8P  8PP"""""""  88       d8  88          8PP"""""""  8b          ,adPPPPP88    88    8PP"""""""  8b       88  
    88      .a8P   "8b,   ,aa  88b,   ,a8"  88          "8b,   ,aa  "8a,   ,aa  88,    ,88    88,   "8b,   ,aa  "8a,   ,d88  
    88888888Y"'     `"Ybbd8"'  88`YbbdP"'   88           `"Ybbd8"'   `"Ybbd8"'  `"8bbdP"Y8    "Y888  `"Ybbd8"'   `"8bbdP"Y8  
                               88                                                                                            
                               88                                                                                            

*/

/*
native #Deprecated Compat();
*/

/**
 * <library>omp_database</library>
 */
#pragma deprecated Use `DB_ExecuteQuery`
native DBResult:DB_Query(DB:db, const query[]) = DB_ExecuteQuery;

/**
 * <library>omp_database</library>
 */
#pragma deprecated Use `DB_FreeResultSet`
native bool:DB_FreeResult(DBResult:result) = DB_FreeResultSet;

/**
 * <library>omp_database</library>
 */
#pragma deprecated Use `DB_GetRowCount`
native DB_NumRows(DBResult:result) = DB_GetRowCount;

/**
 * <library>omp_database</library>
 */
#pragma deprecated Use `DB_SelectNextRow`
native bool:DB_NextRow(DBResult:result) = DB_SelectNextRow;

/**
 * <library>omp_database</library>
 */
#pragma deprecated Use `DB_GetFieldCount`
native DB_NumFields(DBResult:result) = DB_GetFieldCount;

/**
 * <library>omp_database</library>
 */
#pragma deprecated Use `DB_GetFieldName`
native bool:DB_FieldName(DBResult:result, field, output[], size = sizeof (output)) = DB_GetFieldName;

/**
 * <library>omp_database</library>
 */
#pragma deprecated Use `DB_GetFieldString`
native bool:DB_GetField(DBResult:result, field, output[], size = sizeof (output)) = DB_GetFieldString;

/**
 * <library>omp_database</library>
 */
#pragma deprecated Use `DB_GetFieldStringByName`
native bool:DB_GetFieldAssoc(DBResult:result, const field[], output[], size = sizeof (output)) = DB_GetFieldStringByName;

/**
 * <library>omp_database</library>
 */
#pragma deprecated Use `DB_GetFieldIntByName`
native DB_GetFieldAssocInt(DBResult:result, const field[]) = DB_GetFieldIntByName;

/**
 * <library>omp_database</library>
 */
#pragma deprecated Use `DB_GetFieldFloatByName`
native Float:DB_GetFieldAssocFloat(DBResult:result, const field[]) = DB_GetFieldFloatByName;

/**
 * <library>omp_database</library>
 */
#pragma deprecated Use `DB_GetLegacyDBResult`
native DB_GetResultMemHandle(DBResult:result) = DB_GetLegacyDBResult;

/**
 * <library>omp_database</library>
 */
#pragma deprecated Use `DB_GetDatabaseConnectionCount`
native DB_DebugOpenFiles() = DB_GetDatabaseConnectionCount;

/**
 * <library>omp_database</library>
 */
#pragma deprecated Use `DB_GetDatabaseResultSetCount`
native DB_DebugOpenResults() = DB_GetDatabaseResultSetCount;

